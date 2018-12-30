ExternalProject_Add(libjpeg
    DEPENDS gcc
    URL "http://download.sourceforge.net/libjpeg-turbo/libjpeg-turbo-1.5.3.tar.gz"
    URL_HASH SHA256=B24890E2BB46E12E72A79F7E965F409F4E16466D00E1DD15D93D73EE6B592523
    CONFIGURE_COMMAND ${EXEC} <SOURCE_DIR>/configure
        --host=${TARGET_ARCH}
        --prefix=${MINGW_INSTALL_PREFIX}
        --disable-shared
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)
