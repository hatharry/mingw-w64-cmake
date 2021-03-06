ExternalProject_Add(zlib
    DEPENDS gcc
    URL "https://zlib.net/zlib-1.2.11.tar.xz"
    URL_HASH SHA256=4ff941449631ace0d4d203e3483be9dbc9da454084111f97ea0a2114e19bf066
    PATCH_COMMAND patch -p1 < ${CMAKE_CURRENT_SOURCE_DIR}/zlib-1-win32-static.patch
    CONFIGURE_COMMAND ${EXEC} CHOST=${TARGET_ARCH} <SOURCE_DIR>/configure
        --prefix=${MINGW_INSTALL_PREFIX}
        --static
    BUILD_COMMAND ${MAKE}
    BUILD_IN_SOURCE 1
    INSTALL_COMMAND ${MAKE} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)
