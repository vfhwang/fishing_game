function love.load()

    love.window.setMode(411, 731)
    windowWidth = love.graphics.getWidth()
    windowHeight = love.graphics.getHeight()

    require "sharpImages"

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


    --background
    love.graphics.setBackgroundColor( 1, 1, 1, 1 )
    background = love.graphics.newImage("img/background.png")

    --setting win conditions
    winning = true
    timer = 0
    countdown = ""

    --start the game
    currentScreen = "menu"

    -- remember to set these to false later!
    fish = true
    catch = true

end

function getImageScaleForNewDimensions( image, newWidth, newHeight )
    local currentWidth, currentHeight = image:getDimensions()
    return ( newWidth / currentWidth ), ( newHeight / currentHeight )
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
    gameTitle = love.graphics.newImage("img/gametitle.png")
    local scaleX, scaleY = getImageScaleForNewDimensions(gameTitle, 411, 300)
    love.graphics.draw(gameTitle,0,0,0,scaleX,scaleY)

    water = love.graphics.newImage("img/water.png")
    local scaleX, scaleY = getImageScaleForNewDimensions(water, 411, 442)
    love.graphics.draw(water,0,windowHeight-442,0,scaleX,scaleY)    

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
    tick.update(dt)

    if fish then


    end

    if catch then
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



    rod = love.graphics.newImage("img/rod.png")
    local scaleX, scaleY = getImageScaleForNewDimensions(rod, 252, 352)
    love.graphics.draw(rod,0,windowHeight-442,windowWidth-rod:getWidth(),scaleX,scaleY)    
print (windowWidth-rod:getWidth())
print(scaleY)

    if fish then


    end

    if catch then
        bob:draw()
        catcher:draw()

        love.graphics.setColor(255,255,255,255)
        love.graphics.print(countdown,100,150,0,1,1)
    end
end


function love.draw()
    -- love.graphics.draw(background,0,0,0,1,1)
    if currentScreen == 'menu' then
        menuDraw(dt)
    else
        gameDraw(dt)
    end

end





