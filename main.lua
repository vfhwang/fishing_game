function love.load()

    math.randomseed(os.time())


    tick = require "tick"
    Object = require "classic"


    require "bob"
    bob = Bob()

    require "catcher"
    catcher= Catcher()

    -- Setting the initial speed of the bob
    speed = 1
    -- changing the bob speed and direction every second
    tick.recur(function() speed = math.random(-200,200) end ,  1)

end


-- function randomMovement(dt)
--     direction = true
--     speed = math.random(-3,3)
-- end

function love.update(dt)
    tick.update(dt)
    bob:update(dt)
    catcher:update(dt)
    -- randomMovement(dt)

    if bob.y > catcher.bottom then 
    love.graphics.setBackgroundColor( 1, 0, 0, 1 )
    elseif bob.y < catcher.top then
    love.graphics.setBackgroundColor( 1, 0, 0, 1 )
    else
    love.graphics.setBackgroundColor( 0, 0, 0, 1 )

    end

end


function love.draw()
bob:draw()
catcher:draw()

end



function love.keypressed(key, unicode)
    if key == "f" then love.window.setFullscreen(true, "desktop") end
    if key == "escape" then love.window.setFullscreen(false, "desktop") end

end



