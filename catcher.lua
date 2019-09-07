Catcher = Object:extend()

catcherHeight = 300

function Catcher:new()
    self.x = 0
    self.y = bob.y - catcherHeight/2
    self.width = love.graphics.getPixelWidth()

end

function Catcher:update(dt)
    if love.mouse.isDown(1) then
    if   self.y < 0 then
            self.y = 5
     else
        self.y = self.y - 5
     end
    elseif 
    self.y > love.graphics.getPixelHeight()- catcherHeight - 5 then
    self.y = love.graphics.getPixelHeight()-catcherHeight
    else
    self.y = self.y + 5
    end
    self.top = self.y
    self.bottom = self.y + catcherHeight
end


function Catcher:draw()
    love.graphics.setColor( 1, 1, 1, .5 )
    love.graphics.rectangle("fill",self.x,self.y,self.width,catcherHeight)
end