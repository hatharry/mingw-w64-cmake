ExternalProject_Add(opus
    DEPENDS gcc
    URL "https://archive.mozilla.org/pub/opus/opus-1.3-beta.tar.gz"
    URL_HASH SHA256=7f56e058c9549d03ae35511ad9e16ef6d1eb257836830d54abff0f495f17e187
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ${EXEC} <SOURCE_DIR>/configure
        --host=${TARGET_ARCH}
        --prefix=${MINGW_INSTALL_PREFIX}
        --disable-shared
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)
