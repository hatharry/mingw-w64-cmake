if(NOT WIN32)
    find_program(WINE wine)
    set(TARGET_EXEC "TARGET_EXEC=${WINE}")
endif()

ExternalProject_Add(fribidi
    DEPENDS gcc
    GIT_REPOSITORY "https://github.com/fribidi/fribidi.git"
    UPDATE_COMMAND ""
    PATCH_COMMAND ${EXEC} git am ${CMAKE_CURRENT_SOURCE_DIR}/fribidi-*.patch
    # certain env variables with spaces confuse this broken build system
    CONFIGURE_COMMAND ${EXEC} PKG_CONFIG=pkg-config <SOURCE_DIR>/configure
        --host=${TARGET_ARCH}
        --prefix=${MINGW_INSTALL_PREFIX}
        --disable-shared
        --disable-deprecated
        --without-glib
        --enable-charsets
        --enable-malloc
    BUILD_COMMAND ${MAKE} -j1 ${TARGET_EXEC} # breaks with parallel make
    INSTALL_COMMAND ${MAKE} -j1 install
    BUILD_IN_SOURCE 1
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(fribidi)
autoreconf(fribidi)
