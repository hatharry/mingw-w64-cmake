ExternalProject_Add(wxWidgets
    DEPENDS gcc expat libiconv libjpeg libpng
    URL "https://github.com/wxWidgets/wxWidgets/releases/download/v3.1.1/wxWidgets-3.1.1.tar.bz2"
    URL_HASH SHA256=c925dfe17e8f8b09eb7ea9bfdcfcc13696a3e14e92750effd839f5e10726159e
    CONFIGURE_COMMAND ${EXEC} <SOURCE_DIR>/configure
        --host=${TARGET_ARCH}
        --prefix=${MINGW_INSTALL_PREFIX}
        --disable-shared
        --enable-gui
        --disable-stl
        --enable-threads
        --enable-unicode
        --disable-universal
        --with-themes=all
        --with-msw
        --with-opengl
        --with-libpng=sys
        --with-libjpeg=sys
        --with-zlib=sys
        --with-expat=sys
        --without-sdl
        --without-gtk
        --without-libxpm
        --without-libmspack
        --without-gnomevfs
        --without-dmalloc
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
        COMMAND ${CMAKE_COMMAND} -E create_symlink ${MINGW_INSTALL_PREFIX}/bin/wx-config ${CMAKE_INSTALL_PREFIX}/bin/wx-config
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)
