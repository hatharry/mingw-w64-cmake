ExternalProject_Add(sdl2_mixer
    DEPENDS sdl2 vorbis
    HG_REPOSITORY "http://hg.libsdl.org/SDL_mixer"
    UPDATE_COMMAND ""
    PATCH_COMMAND patch -p1 -i ${CMAKE_CURRENT_SOURCE_DIR}/sdl2_mixer-static.patch
    CONFIGURE_COMMAND ${EXEC} <SOURCE_DIR>/configure
        --host=${TARGET_ARCH}
        --prefix=${MINGW_INSTALL_PREFIX}
        --libdir=${MINGW_INSTALL_PREFIX}/lib
        --disable-shared
        --disable-sdltest
        --disable-music-cmd
        --disable-music-mod
        --disable-music-midi
        --disable-music-mp3
        --disable-music-flac
        --enable-music-ogg
        --disable-music-ogg-shared
    BUILD_COMMAND ${MAKE}
    INSTALL_COMMAND ${MAKE} install
    LOG_DOWNLOAD 1 LOG_UPDATE 1 LOG_CONFIGURE 1 LOG_BUILD 1 LOG_INSTALL 1
)

force_rebuild_hg(sdl2_mixer)
autogen(sdl2_mixer)
