package = "lua-resty-http"
version = "0.10-0"

source = {
   url = "git://github.com/zotovsa/luatest",
   tag = "v0.10"
}

description = {
   summary = "Lua HTTP client cosocket driver for OpenResty / ngx_lua.",
   homepage = "https://github.com/zotovsa/luatest",
   license = "2-clause BSD",
   maintainer = "test <james@pintsized.co.uk>"
}

dependencies = {
   "lua >= 5.1"
}

build = {
   type = "builtin",
   modules = {
      ["resty.http"] = "lib/resty/http.lua",
      ["resty.http_headers"] = "lib/resty/http_headers.lua"
   }
}
