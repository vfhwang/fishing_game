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
    noFish = math.random(1,5)
    fishAppears = math.random(1,2)

    -- changing the bob speed and direction every second
    tick.recur(function() speed = math.random(-200,200) end,  whenSpeedChanges)

    tick.delay(function() fish = true 
        tick.delay(function() fish = false end, fishAppears)
end, noFish)

    --background
    love.graphics.setBackgroundColor( 1, 1, 1, 1 )
    background = love.graphics.newImage("img/background.png")

    --setting win conditions
    winning = true
    timer = 100
    countdown = ""

    --start the game
    currentScreen = "menu"

    fish = false
    catching = false
    fishCaught = 0 


    --images
    rod = love.graphics.newImage("img/rod.png")
    gameTitle = love.graphics.newImage("img/gametitle.png")
    water = love.graphics.newImage("img/water.png")
    wiggle = love.graphics.newImage("img/wiggle.png")
    bitmap = love.graphics.newImage("img/bitmap.png")
    bigblob = love.graphics.newImage("img/bigblob.png")




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
    local scaleX, scaleY = getImageScaleForNewDimensions(gameTitle, 411, 300)
    love.graphics.draw(gameTitle,0,0,0,scaleX,scaleY)

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
    love.graphics.print("Fish caught: " .. fishCaught, 30, 30,0,3,3)

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


function love.draw()
    if currentScreen == 'menu' then
        menuDraw(dt)
    else
        gameDraw(dt)
    end

end

function resetGame()
    fish = false
    catching = false
    timer = 0

    tick.delay(function() fish = true end, noFish)
    love.graphics.setBackgroundColor( 1, 1, 1, 1 )

end




