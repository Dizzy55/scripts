#!/bin/bash

# Current script dir
temp=$(realpath "$0")
script_path=$(dirname "$temp")
echo "**** Script path: ${script_path}"
# Dir to place PRM
downloads_dir=/home/${SDK_SSH_USER}/Downloads/
# Dir to unpack library
unpacked_library_dir=/home/${SDK_SSH_USER}/Downloads/${LIBRARY_NAME}
# Dir to place unpacked library on host machine
host_dependencies_path="${script_path}/../../dependencies"

sdk_cmd echo ""
if [ $? -ne 0 ]; then
    echo "Can not connect to SDK"
    exit 1
fi

echo ""
echo "**** zypper update ****"
sdk_root_cmd zypper update

echo ""
echo "**** Create ${downloads_dir} dir for downloads"
sdk_cmd mkdir ${downloads_dir}

sdk_cmd sdk-assistant list | grep -o ${SDK_TARGET_PATTERN} | while read TARGET; do
    echo ""
    echo "**** Download ${PACKAGE} on ${TARGET} from repo ****"
    sdk_cmd sb2 -t ${TARGET} -m sdk-install -R zypper download ${PACKAGE}

    echo ""
    package_version=$(sdk_cmd sb2 -t ${TARGET} -m sdk-install "zypper info ${PACKAGE} | grep 'Version' | cut -d ':' -f2 | xargs")
    echo "package_version: ${package_version}"

    echo ""
    architecture=$(sdk_cmd sb2 -t ${TARGET} g++ -dumpmachine)
    echo "**** Full architecture name: ${architecture}"

    arch=$(get_short_architecture ${architecture})
    echo "**** Short architecture name: ${arch}"

    zypper_cache_dir_with_arch=${SDK_ZYPPER_CACHE_DIR}/${arch}
    echo "**** Zypper cache dir with arch name: ${zypper_cache_dir_with_arch}"

    rpm_name=${PACKAGE}-${package_version}.${arch}.rpm
    echo "**** Package name: ${rpm_name}"

    downloaded_rpm_fullname=${zypper_cache_dir_with_arch}/${rpm_name}

    echo ""
    echo "**** Move ${downloaded_rpm_fullname} to ${downloads_dir} ****"
    sdk_cmd sb2 -t ${TARGET} -R mv "${downloaded_rpm_fullname}" "${downloads_dir}/" || exit 2

    unpacked_dir=${unpacked_library_dir}/${TARGET}

    echo ""
    echo "**** Create ${unpacked_dir} dir for unpack RPM"
    sdk_cmd mkdir -p ${unpacked_dir}

    echo "Unpack ${rpm_name} to ${unpacked_dir}"
    sdk_cmd "cd ${unpacked_dir}/ && rpm2cpio ${downloads_dir}/${rpm_name} | cpio -idmv"
done

echo ""
echo "Create ${host_dependencies_path} dir for results in host"
mkdir -p ${host_dependencies_path}

echo "**** Copy remote ${unpacked_library_dir} to ${host_dependencies_path}"
scp -r -P $SDK_SSH_PORT -i "$SDK_SSH_ID" -o "StrictHostKeyChecking=no" "$SDK_SSH_USER@$SDK_SSH_HOST:${unpacked_library_dir}" "${host_dependencies_path}/"
