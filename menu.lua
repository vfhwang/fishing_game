
-- Menu
function menuUpdate(dt)
    function love.mousepressed(x, y)
        print("clicked")
        if x > 100 and y > 100 then
            currentScreen="game"
        end
    end
end

function menuDraw(dt)
    local scaleX, scaleY = getImageScaleForNewDimensions(gameTitle, 411, 300)
    love.graphics.draw(gameTitle,0,0,0,scaleX,scaleY)

    local scaleX, scaleY = getImageScaleForNewDimensions(water, 411, 442)
    love.graphics.draw(water,0,windowHeight-442,0,scaleX,scaleY)    

end