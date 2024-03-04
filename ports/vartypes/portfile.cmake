vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO lordhippo/vartypes
    REF cdfdb8ab68c1ceab6f8a2350244777de3c945be9
    SHA512 2ffb2d2990d89783c1025e9fe40b10a30e473666ba79156c46fc379655a33941acd95ce6c0739144d549b05d2df3d9d13bc6b3801de32032942bf72699d92148
    HEAD_REF master
)

vcpkg_cmake_configure(
    SOURCE_PATH ${SOURCE_PATH}
    OPTIONS
        -DBUILD_EXAMPLE=OFF)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME "vartypes")

file(INSTALL "${SOURCE_PATH}/COPYING" DESTINATION "${CURRENT_PACKAGES_DIR}/share/vartypes" RENAME copyright)
