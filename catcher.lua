Catcher = Object:extend()

catcherHeight = 200

function Catcher:new()
    self.x = 0
    self.y = bob.y - catcherHeight/2

end

function Catcher:update(dt)
    if love.keyboard.isDown("space") then
        self.y = self.y - 5
    elseif self.y > love.graphics.getPixelHeight()-catcherHeight 
    then
        self.y = love.graphics.getPixelHeight()-catcherHeight
    else
    self.y = self.y + 5
    end
    self.top = self.y
    self.bottom = self.y + catcherHeight
end


function Catcher:draw()
    love.graphics.setColor( 1, 1, 1, .5 )
    love.graphics.rectangle("fill",self.x,self.y,love.graphics.getPixelWidth(),catcherHeight)
end