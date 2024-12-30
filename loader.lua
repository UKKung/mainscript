Print ("k4zmm_'s Script is loading...")
wait(0.5)
_G.Mode = 'Normal'
-- _G.Mode = 'something'
local gameid = game.PlaceId

if syn then request = syn.request end
  if (gameid == 9912491609) and (_G.Mode == 'Normal') then
    loadstring(request({['Url'] = 'https://raw.githubusercontent.com/UKKung/mainscript/refs/heads/main/fisch.lua', ['Method'] = 'GET'}).Body)()
  elseif (gameid == 00000000) or (gameid == 123456789) and (_G.Mode == 'something') then
    loadstring(request({['Url'] = 'www.google.com', ['Method'] = 'GET'}).Body)()
  else
    print('valid game')
end

-- loadstring(request({['Url'] = 'https://raw.githubusercontent.com/UKKung/mainscript/refs/heads/main/loader.lua', ['Method'] = 'GET'}).Body)()
