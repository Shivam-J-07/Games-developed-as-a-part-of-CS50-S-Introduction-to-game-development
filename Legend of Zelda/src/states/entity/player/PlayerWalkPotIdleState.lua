PlayerWalkPotIdleState = Class{__includes = EntityIdleState}

function PlayerWalkPotIdleState:enter(params)
    -- render offset for spaced character sprite
    self.entity.offsetY = 5
    self.entity.offsetX = 0

    self.entity.carryingPot.y = self.entity.y - 9
    self.entity.carryingPot.x = self.entity.x
end

function PlayerWalkPotIdleState:update(dt)

    EntityIdleState.update(self, dt)

    if love.keyboard.isDown('left') or love.keyboard.isDown('right') or
       love.keyboard.isDown('up') or love.keyboard.isDown('down') then
        self.entity:changeState('walk-pot')
    end

    if love.keyboard.wasPressed('f') then
      self.entity:changeState('throw-pot')
    end
end
