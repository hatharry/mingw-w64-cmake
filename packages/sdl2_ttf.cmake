ExternalProject_Add(sdl2_ttf
    DEPENDS sdl2 freetype2
    HG_REPOSITORY "http://hg.libsdl.org/SDL_ttf/"
    UPDATE_COMMAND ""
    PATCH_COMMAND patch -p1 -i ${CMAKE_CURRENT_SOURCE_DIR}/sdl2_ttf-static.patch
    CONFIGURE_COMMAND ${EXEC} <SOURCE_DIR>/configure
        --host=${TARGET_ARCH}
        --prefix=${MINGW_INSTALL_PREFIX}
        --libdir=${MINGW_INSTALL_PREFIX}/lib
        --disable-shared
        --disable-sdltest
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

autogen(sdl2_ttf)
force_rebuild_hg(sdl2_ttf)
