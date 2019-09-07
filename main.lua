function love.load()

    --setting a random thing
    math.randomseed(os.time())

    --library to do help do omething at time intervals
    tick = require "tick"

    --library to create classes
    Object = require "classic"

    -- the thing they're trying to catch
    require "bob"
    bob = Bob()

    -- the thing the player needs to move
    require "catcher"
    catcher= Catcher()

    -- Setting the initial speed of the bob
    speed = 1
    whenSpeedChanges = math.random(1,3)

    -- changing the bob speed and direction every second
    tick.recur(function() speed = math.random(-200,200) end ,  whenSpeedChanges)



    love.graphics.setBackgroundColor( 26/255, 17/255, 105/255, 1 )

    --setting win conditions
    winning = true
    timer = 0
    countdown = ""

end


function didTheyCatchIt(winning)
    if winning then
        timer = timer + 5
        love.graphics.setBackgroundColor( 26/255, 17/255, 105/255, 1 )
        else
        timer = 0
        love.graphics.setBackgroundColor( 143/255, 10/255, 48/255, 1 )
        countdown = ""
        end
    if timer > 300 and timer < 599 then
        countdown = "3"
    elseif timer > 600 and timer < 899 then
        countdown = "2"
    elseif timer > 899 and timer < 1199 then
        countdown = "1"
    elseif timer > 1200 then
        countdown = "caught!"
        love.graphics.setBackgroundColor( 0/255, 74/255, 54/255, 1 )
    end

end


function love.update(dt)
    tick.update(dt)
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





function love.draw()
bob:draw()
catcher:draw()

love.graphics.setColor(255,255,255,255)

love.graphics.print(countdown,100,150,0,10,10)


end



function love.keypressed(key, unicode)
    if key == "f" then love.window.setFullscreen(true, "desktop") end
    if key == "escape" then love.window.setFullscreen(false, "desktop") end

end



