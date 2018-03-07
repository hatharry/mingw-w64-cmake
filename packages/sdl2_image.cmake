ExternalProject_Add(sdl2_image
    DEPENDS sdl2 libjpeg libpng
    HG_REPOSITORY "http://hg.libsdl.org/SDL_image"
    UPDATE_COMMAND ""
    PATCH_COMMAND patch -p1 -i ${CMAKE_CURRENT_SOURCE_DIR}/sdl2_image-static.patch
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

force_rebuild_hg(sdl2_image)
autogen(sdl2_image)
