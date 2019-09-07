local _newImage = love.graphics.newImage -- the old function
function love.graphics.newImage(...) -- new function. The ... is to forward any parameters to the old function
     local img = _newImage(...)
     img:setFilter('nearest', 'nearest')
     return img
end

