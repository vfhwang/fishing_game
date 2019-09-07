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

    require "didTheyCatchIt"

    -- Setting the initial speed of the bob
    speed = 1
    whenSpeedChanges = math.random(1,3)

    -- changing the bob speed and direction every second
    tick.recur(function() speed = math.random(-200,200) end ,  whenSpeedChanges)

    fish = true

    love.graphics.setBackgroundColor( 26/255, 17/255, 105/255, 1 )

    --setting win conditions
    winning = true
    timer = 0
    countdown = ""

    --start the game
    currentScreen = "menu"

end


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
    love.graphics.print("fishing game",100,150,0,1,1)
    love.graphics.print("click to start",100,170,0,1,1)
end

function love.update(dt)
    if currentScreen== "menu" then
    menuUpdate(dt)
    else
    gameUpdate(dt)
    end
end

-- Game
function gameUpdate(dt)
    -- if fish then

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

    function love.mousepressed(x, y)
        print(x)
        if x < 100 and y < 100 then
            currentScreen="menu"
    end
end
end

function gameDraw(dt)
bob:draw()
catcher:draw()

love.graphics.setColor(255,255,255,255)
love.graphics.print(countdown,100,150,0,1,1)
end


function love.draw()
    if currentScreen == 'menu' then
        menuDraw(dt)
    else
        gameDraw(dt)
    end

end





