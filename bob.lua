Bob = Object:extend()


function Bob:new()
    self.x= love.graphics.getPixelWidth()/2
    self.y= math.random(100,500)

end

function Bob:update(dt)
    if self.y > love.graphics.getPixelHeight()-50 then
        self.y = love.graphics.getPixelHeight()-50
    elseif self.y < 50 then
        self.y = 50
else
    self.y = self.y + (speed*dt)
end
end

function Bob:draw()
    love.graphics.circle("fill",self.x,self.y,5)

end