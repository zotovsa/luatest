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


return _M
