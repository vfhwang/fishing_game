
function didTheyCatchIt(winning)
    if winning then
        timer = timer + 5
        elseif timer < 0 then
            timer = 0
        else
        timer = timer - 10
        end


        if timer > 1200 then
        -- countdown = "caught!"
        -- love.graphics.setBackgroundColor( 0/255, 74/255, 54/255, 0.5 )
        fishCaught = fishCaught + 1
        -- if fishCaught > maxScor then
        --     score:saveMaxScore()
        -- end
        resetGame()

    end

end
