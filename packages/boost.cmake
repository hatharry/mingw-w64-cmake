ExternalProject_Add(boost
    DEPENDS gcc bzip2 expat zlib
    URL "https://dl.bintray.com/boostorg/release/1.66.0/source/boost_1_66_0.tar.bz2"
    URL_HASH SHA256=5721818253e6a0989583192f96782c4a98eb6204965316df9f5ad75819225ca9
    CONFIGURE_COMMAND ${EXEC} cd <SOURCE_DIR>/tools/build && ./bootstrap.sh
    BUILD_COMMAND ${EXEC} <SOURCE_DIR>/tools/build/b2
        -a
        -q
        -j ${MAKEJOBS}
        --ignore-site-config
        --user-config=${JAM_CONFIG}
        abi=ms
        address-model=${TARGET_BITS}
        architecture=x86
        binary-format=pe
        link=static
        target-os=windows
        threadapi=win32
        threading=multi
        variant=release
        toolset=gcc-mingw
        --layout=tagged
        --disable-icu
        --without-mpi
        --without-python
        --prefix=${MINGW_INSTALL_PREFIX}
        --exec-prefix=${MINGW_INSTALL_PREFIX}/bin
        --libdir=${MINGW_INSTALL_PREFIX}/lib
        --includedir=${MINGW_INSTALL_PREFIX}/include
        -sEXPAT_INCLUDE=${MINGW_INSTALL_PREFIX}/include
        -sEXPAT_LIBPATH=${MINGW_INSTALL_PREFIX}/lib
        install
    BUILD_IN_SOURCE 1
    INSTALL_COMMAND ""
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)
