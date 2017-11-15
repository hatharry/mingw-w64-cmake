ExternalProject_Add(icu
    DEPENDS gcc
    URL "http://download.icu-project.org/files/icu4c/60.1/icu4c-60_1-src.tgz"
    URL_HASH SHA256=f8f5a6c8fbf32c015a467972bdb1477dc5f5d5dfea908b6ed218715eeb5ee225
    CONFIGURE_COMMAND ${EXEC} mkdir -p <BINARY_DIR>/native && cd <BINARY_DIR>/native && <SOURCE_DIR>/source/configure CC=${CMAKE_C_COMPILER} CXX=${CMAKE_CXX_COMPILER}
        COMMAND ${EXEC} cd <BINARY_DIR>/native && make -j${MAKEJOBS}
        COMMAND ${EXEC} <SOURCE_DIR>/source/configure
            --host=${TARGET_ARCH}
            --prefix=${MINGW_INSTALL_PREFIX}
            --with-cross-build=<BINARY_DIR>/native
            CFLAGS=-DU_USING_ICU_NAMESPACE=0
            CXXFLAGS=--std=gnu++0x
            SHELL=bash
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
        COMMAND ${CMAKE_COMMAND} -E create_symlink ${MINGW_INSTALL_PREFIX}/bin/icu-config ${CMAKE_INSTALL_PREFIX}/bin/icu-config
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

ExternalProject_Add_Step(icu autoreconf
    DEPENDEES download update patch
    DEPENDERS configure
    COMMAND ${EXEC} cd <SOURCE_DIR>/source && autoreconf -fi
    WORKING_DIRECTORY <SOURCE_DIR>/source
)
