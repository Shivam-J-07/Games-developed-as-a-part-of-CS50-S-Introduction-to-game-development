IncreaseStatsState = Class{__includes = BaseState}

function IncreaseStatsState:init(def)
  self.stats = Menu{
    x = VIRTUAL_WIDTH - VIRTUAL_WIDTH/2 - 85 ,
    y = VIRTUAL_HEIGHT - VIRTUAL_HEIGHT/2 - 75,
    width = 170,
    height = 150,
    items = def.statImprovements,
    cursorActive = false
  }
end

function IncreaseStatsState:update(dt)
  if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
    gStateStack:pop()
    self:fadeOutWhite()
  end
  self.stats:update(dt)
end

function IncreaseStatsState:render()
  self.stats:render()
end

function IncreaseStatsState:fadeOutWhite()
    -- fade in
    gStateStack:push(FadeInState({
        r = 255, g = 255, b = 255
    }, 1,
    function()

        -- resume field music
        gSounds['victory-music']:stop()
        gSounds['field-music']:play()

        -- pop off the battle state
        gStateStack:pop()
        gStateStack:push(FadeOutState({
            r = 255, g = 255, b = 255
        }, 1, function() end))
    end))
end
