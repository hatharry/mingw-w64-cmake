ExternalProject_Add(wxWidgets
    DEPENDS gcc expat libiconv libjpeg libpng
    URL "https://github.com/wxWidgets/wxWidgets/releases/download/v3.1.0/wxWidgets-3.1.0.tar.bz2"
    URL_HASH SHA256=e082460fb6bf14b7dd6e8ac142598d1d3d0b08a7b5ba402fdbf8711da7e66da8
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
        --without-motif
        --without-mac
        --without-macosx-sdk
        --without-cocoa
        --without-wine
        --without-pm
        --without-microwin
        --without-libxpm
        --without-libmspack
        --without-gnomeprint
        --without-gnomevfs
        --without-hildon
        --without-dmalloc
        --without-odbc
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
        COMMAND ${CMAKE_COMMAND} -E create_symlink ${MINGW_INSTALL_PREFIX}/bin/wx-config ${CMAKE_INSTALL_PREFIX}/bin/wx-config
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)
