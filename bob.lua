Bob = Object:extend()

bobSize = 10


function Bob:new()
    self.x= windowWidth/2
    self.y= math.random(100,500)

end

function Bob:update(dt)
    if self.y > love.graphics.getPixelHeight()- 120 - (speed*dt) then
        self.y = love.graphics.getPixelHeight()- 120
    elseif self.y < 140 then
        self.y = 140
else
    self.y = self.y + (speed*dt)
end
end

function Bob:draw()
    love.graphics.setColor( 1, 0, 0, 1 )
    love.graphics.circle("fill",self.x,self.y,bobSize)

end