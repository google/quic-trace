load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def _non_module_deps_impl(ctx):

    http_archive(
        name = "sdl2",
        build_file = "//external:sdl2.BUILD",
        sha256 = "e6a7c71154c3001e318ba7ed4b98582de72ff970aca05abc9f45f7cbdc9088cb",
        strip_prefix = "SDL2-2.0.8",
        urls = ["https://www.libsdl.org/release/SDL2-2.0.8.zip"],
    )

    http_archive(
        name = "sdl2_ttf",
        build_file = "//external:sdl2_ttf.BUILD",
        sha256 = "ad7a7d2562c19ad2b71fa4ab2e76f9f52b3ee98096c0a7d7efbafc2617073c27",
        strip_prefix = "SDL2_ttf-2.0.14",
        urls = ["https://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-2.0.14.zip"],
    )

    http_archive(
        name = "freetype",
        build_file = "//external:freetype.BUILD",
        # We patch out some modules we don't use from freetype config file.
        patch_args = ["-p1"],
        patches = ["//external:freetype_config.patch"],
        sha256 = "bf380e4d7c4f3b5b1c1a7b2bf3abb967bda5e9ab480d0df656e0e08c5019c5e6",
        strip_prefix = "freetype-2.9",
        urls = ["https://download.savannah.gnu.org/releases/freetype/freetype-2.9.tar.gz"],
    )

non_module_deps = module_extension(implementation = _non_module_deps_impl)
