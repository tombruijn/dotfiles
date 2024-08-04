utils = {}

function utils.sleep(seconds)
  local sec = tonumber(os.clock() + seconds);
  while (os.clock() < sec) do
  end
end

return utils
