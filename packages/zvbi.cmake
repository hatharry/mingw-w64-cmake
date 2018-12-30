ExternalProject_Add(zvbi
    DEPENDS 
        libiconv
    URL "http://download.sourceforge.net/zapping/zvbi-0.2.35.tar.bz2"
    URL_HASH SHA256=FC883C34111A487C4A783F91B1B2BB5610D8D8E58DCBA80C7AB31E67E4765318
    PATCH_COMMAND patch -p0 -i ${CMAKE_CURRENT_SOURCE_DIR}/zvbi-win32.patch && patch -p0 -i ${CMAKE_CURRENT_SOURCE_DIR}/zvbi-ioctl.patch && patch -p0 -i ${CMAKE_CURRENT_SOURCE_DIR}/zvbi-no-contrib.diff
    CONFIGURE_COMMAND ${EXEC} <SOURCE_DIR>/configure
        --host=${TARGET_ARCH}
        --prefix=${MINGW_INSTALL_PREFIX}
        --disable-dvb 
        --disable-bktr
        --disable-nls 
        --disable-proxy
        --disable-shared
        --without-doxygen
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)
