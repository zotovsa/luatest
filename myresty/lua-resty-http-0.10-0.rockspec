package = "lua-resty-http"
version = "0.10-0"

source = {
   url = "git://github.com/zotovsa/luatest",
   tag = "master"
}

description = {
   summary = "Lua HTTP client cosocket driver for OpenResty / ngx_lua.",
   homepage = "https://github.com/zotovsa/luatest/myresty",
   license = "2-clause BSD",
   maintainer = "test <james@pintsized.co.uk>"
}

dependencies = {
   "lua >= 5.1"
}

build = {
   type = "builtin",
   modules = {
      ["lua.utils"] = "myresty/lib/resty/lua_utils.lua",
      ["resty.http"] = "myresty/lib/resty/http.lua",
      ["resty.http_headers"] = "myresty/lib/resty/http_headers.lua"
   }
}
