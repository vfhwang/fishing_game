
-- Game
function gameUpdate(dt)
    tick.update(dt)

    if fish then
        if love.mouse.isDown(1) then
            catching = true
             end
    end

    if catching then
        fish = false
    bob:update(dt)
    catcher:update(dt)
    -- randomMovement(dt)



        if bob.y > catcher.bottom then
        winning = false
        elseif bob.y < catcher.top then
        winning = false
        else
        winning = true
        end
    didTheyCatchIt(winning)
    end


    function love.mousepressed(x, y)
        print(x)
        if x < 100 and y < 100 then
            currentScreen="menu"
    end

end
end

function gameDraw(dt)

    love.graphics.setColor( 0, 0, 0, 1 )
    love.graphics.printf(fishCaught, 30, 30, 400, "left",0,1,1)
    love.graphics.printf("High Score:" .. fishCaught, windowWidth-430, 30, 400, "right",0,1,1)


    local scaleX, scaleY = getImageScaleForNewDimensions(rod, 252, 352)
    love.graphics.draw(rod,windowWidth-rod:getWidth(),windowHeight-442,0,scaleX,scaleY)    


    if fish then
        local scaleX, scaleY = getImageScaleForNewDimensions(wiggle, 185, 360)
        love.graphics.draw(wiggle,windowWidth-rod:getWidth()-40,windowHeight-500+(math.random(-2,2)),0,scaleX,scaleY)   

    end

    if catching then


        love.graphics.setColor( 1, 0, 0, 1 )
        love.graphics.rectangle("fill",0,0,windowWidth,windowHeight*timer/1200)

        local scaleX, scaleY = getImageScaleForNewDimensions(bitmap, 412, 731)
        love.graphics.draw(bitmap,0,0,0,scaleX,scaleY)   

    
        local scaleX, scaleY = getImageScaleForNewDimensions(bigblob, 252, 540)
        love.graphics.draw(bigblob,windowWidth/2-bigblob:getWidth()/2,windowHeight/2-bigblob:getHeight()/2,0,scaleX,scaleY)   

        catcher:draw()
        bob:draw()


        love.graphics.setColor(255,255,255,255)
        love.graphics.print(countdown,100,150,0,1,1)
    end
end


function resetGame()
    fish = false
    catching = false
    timer = 0

    tick.delay(function() fish = true 

     -- then make the fish dissapear
    tick.delay(function() fish = false end, fishAppears)

    
    end, noFish)
    love.graphics.setBackgroundColor( 1, 1, 1, 1 )

end