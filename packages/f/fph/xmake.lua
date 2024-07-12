package("fph")
    set_kind("library", {headeronly = true})
    set_homepage("https://github.com/renzibei/fph-table")
    set_description("Flash Perfect Hash")

    add_urls("https://github.com/renzibei/fph-table.git")

    add_versions("2023_8_18", "b99b32ab429eb6256fd8de1e17fe38e4c54eb49c")

    on_install("windows", "linux", "macosx", "msys", "mingw", function (package)
        os.cp("include", package:installdir())
    end)

    on_test(function (package)
        assert(package:check_cxxsnippets({test = [[
                void test() {
                    using FphMap = fph::DynamicFphMap<int, int>;
                    FphMap map{{0,1}, {2,3}};
                }
        ]]}, {configs = {languages = "c++23"}, includes = {"fph/dynamic_fph_table.h.h"}}))
    end)
