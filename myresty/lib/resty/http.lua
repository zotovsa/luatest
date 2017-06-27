local count = 0;

local _M = {
    _VERSION = '0.10',
}

function _M.generateId(self, machineNumber)
  local machineNumber = 923
  local counter = 234

  requestNumber = requestNumber + 1
  local value = math.floor(os.time()*10000+os.clock()*1000000)
  local valueA = math.floor( value / (2 ^ 32) )
  local valueB = value - valueA * (2 ^ 32)

  local moveLeft = 22
  local valueA = bit.lshift( valueA, moveLeft )
  local valueB = bit.rol(valueB, moveLeft)
  local valueA = bit.bor(bit.band(valueB, (2 ^ moveLeft - 1)), valueA)
  local valueB = bit.band(valueB, bit.bnot((2 ^ moveLeft - 1)))


  local valueB = bit.bor(valueB ,bit.lshift(machineNumber, 12))
  local valueB = bit.bor(valueB , counter)


  local valueA = valueA - math.floor( valueA / (2 ^ 32) ) * (2 ^ 32)
  local valueB = valueB - math.floor( valueB / (2 ^ 32) ) * (2 ^ 32)
  return string.format('%02X', valueA) , string.format('%02X', valueB)
end

function _M.doRequest(self, uri, host, port)

  local uri = "/hello";
  local host = "failingapp"
  local port = 8080
  local timeout = 3
  local trycount = 4

  ngx.req.set_uri(uri)

  local http = require "resty.http"
  local httpc = http.new()


  local i = 0
  while i < trycount do
    i = i + 1
    httpc:set_timeout(timeout)
    local ok, err = httpc:connect(host, port)
    if not ok then
      ngx.log(ngx.ERR, err)
      return
    end
    httpc:set_timeout(timeout)
    local ok1, err1 = httpc:proxy_request()
    if ok1.status == 200 then
      httpc:proxy_response(ok1)
      return
    end
    if(i >= trycount) then
      httpc:proxy_response(ok1)
    end
  end
  httpc:set_keepalive()

end

return _M
