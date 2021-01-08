--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

bronze = love.graphics.newImage('bronze-medal.png')

silver = love.graphics.newImage('silver-medal.png')

gold = love.graphics.newImage('gold-medal.png')

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 44, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 80, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(achievementFont)

    love.graphics.draw(bronze, 155, 100, nil, 0.2, 0.2)
    love.graphics.print("Scored more\nthan 2 points", 140, 185)

    love.graphics.draw(silver, 235, 98.5, nil, 0.17, 0.17)
    love.graphics.print("Scored more\nthan 4 points", 225, 185)

    love.graphics.draw(gold, 315, 98.2, nil, 0.267, 0.267)
    love.graphics.print("Scored more\nthan 6 points", 308, 185)

    if self.score >= 2 then
      love.graphics.setColor(0, 255, 0)
      love.graphics.print("Achieved!", 152, 170)
      love.graphics.setColor(255, 255, 255)
    else
      love.graphics.setColor(255, 0, 0)
      love.graphics.print("Missing!", 152, 170)
      love.graphics.setColor(255, 255, 255)
    end

    if self.score >= 4 then
      love.graphics.setColor(0, 255, 0)
      love.graphics.print("Achieved!", 238, 170)
      love.graphics.setColor(255, 255, 255)
    else
      love.graphics.setColor(255, 0, 0)
      love.graphics.print("Missing!", 238, 170)
      love.graphics.setColor(255, 255, 255)
    end

    if self.score >= 6 then
      love.graphics.setColor(0, 255, 0)
      love.graphics.print("Achieved!", 318, 170)
      love.graphics.setColor(255, 255, 255)
    else
      love.graphics.setColor(255, 0, 0)
      love.graphics.print("Missing!", 318, 170)
      love.graphics.setColor(255, 255, 255)
    end

    love.graphics.setFont(mediumFont)

    love.graphics.printf('Press Enter to Play Again!', 0, 230, VIRTUAL_WIDTH, 'center')


end
