
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
