-- Score = Object:extend()

-- -- Set the X and Y position of the score label
-- function Score:new(x, y)
--     self.x = wWidth - 100
--     self.y = 20
-- end

-- function Score:update(dt)

-- end

-- function Score:draw()
--     love.graphics.setColor(255, 255, 255)
--     love.graphics.print("Score: " .. scor, self.x, self.y)
-- end

-- function Score:saveMaxScore()
--     local data = {}-- Make a table to store variables in.
--     data.maxScor = fishCaught
--     -- Save the table to the "savegame.txt" file:
--     love.filesystem.write("savegame.txt", binser.serialize(data))
-- end

-- function Score:loadMaxScore()    
--     if not love.filesystem.exists("savegame.txt") then
--         maxScor = 0
--         Score:saveMaxScore()
--     end
--     -- Load the data table:
--     local data = love.filesystem.load("savegame.txt")
--     -- Copy the variables out of the table:
--     maxScor = data.maxScor
--     return maxScor
-- end