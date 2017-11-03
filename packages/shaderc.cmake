ExternalProject_Add(glslang-download
    GIT_REPOSITORY "https://github.com/google/glslang.git"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
    LOG_DOWNLOAD 1 LOG_UPDATE 1
)

force_rebuild_git(glslang-download)

ExternalProject_Add(spirv-headers-download
    GIT_REPOSITORY "https://github.com/KhronosGroup/SPIRV-Headers.git"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
    LOG_DOWNLOAD 1 LOG_UPDATE 1
)

force_rebuild_git(spirv-headers-download)

ExternalProject_Add(spirv-tools-download
    GIT_REPOSITORY "https://github.com/KhronosGroup/SPIRV-Tools.git"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
    LOG_DOWNLOAD 1 LOG_UPDATE 1
)

force_rebuild_git(spirv-tools-download)

ExternalProject_Add(shaderc
    DEPENDS gcc glslang-download spirv-tools-download spirv-headers-download
    GIT_REPOSITORY "https://github.com/google/shaderc.git"
    UPDATE_COMMAND ""
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${MINGW_INSTALL_PREFIX} -DCMAKE_TOOLCHAIN_FILE=${TOOLCHAIN_FILE} -DCMAKE_BUILD_TYPE=RelWithDebInfo
        -DSHADERC_SKIP_TESTS=ON
    BUILD_COMMAND ${CMAKE_MAKE_PROGRAM}
    INSTALL_COMMAND ${CMAKE_MAKE_PROGRAM} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

ExternalProject_Add_Step(shaderc symlink-third-party
    DEPENDEES download update patch
    DEPENDERS configure
    COMMAND ${CMAKE_COMMAND} -E create_symlink ${CMAKE_CURRENT_BINARY_DIR}/glslang-download-prefix/src/glslang-download <SOURCE_DIR>/third_party/glslang
        COMMAND ${CMAKE_COMMAND} -E create_symlink ${CMAKE_CURRENT_BINARY_DIR}/spirv-headers-download-prefix/src/spirv-headers-download <SOURCE_DIR>/third_party/spirv-headers
        COMMAND ${CMAKE_COMMAND} -E create_symlink ${CMAKE_CURRENT_BINARY_DIR}/spirv-tools-download-prefix/src/spirv-tools-download <SOURCE_DIR>/third_party/spirv-tools
)

force_rebuild_git(shaderc)


