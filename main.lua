function love.load()

    love.window.setMode(411, 731)
    windowWidth = love.graphics.getWidth()
    windowHeight = love.graphics.getHeight()
    pixelFont = love.graphics.newFont( "font/VT323-Regular.ttf", 40 )
    love.graphics.setFont( pixelFont)

    --library to do help do omething at time intervals
    tick = require "lib/tick"

    --library to create classes
    Object = require "lib/classic"
    binser = require "lib/binser"


    require "lib/sharpImages"
    require "menu"
    require "game"
    -- require "score"


    --setting a random thing
    math.randomseed(os.time())

    -- maxScor = Score:loadMaxScore()


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
    noFish = math.random(0,1)
    fishAppears = math.random(2,6)
    timer = 100


    -- changing the bob speed and direction every second
    tick.recur(function(dt) speed = math.random(-500,500) end,  whenSpeedChanges)
    tick.recur(function(dt) fish=true print("FISH!!!") killFish() end,  fishAppears)


    function killFish()
        tick.delay(function() fish=false print("Kill fish now") end, noFish*0.4)
    end




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

function love.update(dt)
    if currentScreen== "menu" then
    menuUpdate(dt)
    else
    gameUpdate(dt)
    end
end

function love.draw(dt)
    if currentScreen == 'menu' then
        menuDraw(dt)
    else
        gameDraw(dt)
    end

end






