--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

PlayerIdleState = Class{__includes = EntityIdleState}

function PlayerIdleState:enter(params)
    -- render offset for spaced character sprite
    self.entity.offsetY = 5
    self.entity.offsetX = 0
end

function PlayerIdleState:update(dt)
    EntityIdleState.update(self, dt)
end

function PlayerIdleState:update(dt)
    if love.keyboard.isDown('left') or love.keyboard.isDown('right') or
       love.keyboard.isDown('up') or love.keyboard.isDown('down') then
        self.entity:changeState('walk')
    end

    if love.keyboard.wasPressed('space') then
        self.entity:changeState('swing-sword')
    end

    local pot = self:checkDistanceBetweenPlayer()

    if love.keyboard.wasPressed('f') and pot ~= nil then
      self.entity.carryingPot = pot
      gSounds['lift-pot']:play()
      self.entity:changeState('lift-pot')
    end
end

function PlayerIdleState:checkDistanceBetweenPlayer()
  for k, object in pairs(self.dungeon.currentRoom.objects) do
    if object.type == 'pot' then
      local distX = math.abs(self.entity.x - object.x)
      local distY = math.abs(self.entity.y - object.y)
      if math.sqrt((distX ^ 2) + ( distY ^ 2)) < 24 then
        return object
      end
    end
  end
end
