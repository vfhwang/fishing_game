Catcher = Object:extend()

catcherHeight = 169

function Catcher:new()
    whitedot = love.graphics.newImage("img/whitedot.png")
    self.x = windowWidth/2 - whitedot:getWidth()/2
    self.y = bob.y - catcherHeight/2
    self.width = love.graphics.getPixelWidth()

end

function Catcher:update(dt)
    if love.mouse.isDown(1) then
    if   self.y < 110 then
            self.y = 110
     else
        self.y = self.y - 5
     end
    elseif 
    self.y > love.graphics.getPixelHeight()- catcherHeight - 100 - 5 then
    self.y = love.graphics.getPixelHeight()-catcherHeight - 100
    else
    self.y = self.y + 5
    end
    self.top = self.y
    self.bottom = self.y + catcherHeight
end


function Catcher:draw()
    love.graphics.setColor( 1, 1, 1, 1 )
    local scaleX, scaleY = getImageScaleForNewDimensions(whitedot, 169, 169)
    love.graphics.draw(whitedot,self.x,self.y,0,scaleX,scaleY)    

end