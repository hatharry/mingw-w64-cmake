ExternalProject_Add(mujs
    DEPENDS gcc
    GIT_REPOSITORY "git://git.ghostscript.com/mujs.git"
    UPDATE_COMMAND ""
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ${MAKE}
        CC=${TARGET_ARCH}-gcc
        AR=${TARGET_ARCH}-ar
        RANLIB=${TARGET_ARCH}-ranlib
    INSTALL_COMMAND ${MAKE} prefix=${MINGW_INSTALL_PREFIX} install
    BUILD_IN_SOURCE 1
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_git(mujs)
