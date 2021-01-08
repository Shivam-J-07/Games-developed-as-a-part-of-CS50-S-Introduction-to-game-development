PlayerLiftPotState = Class {__includes = BaseState}

function PlayerLiftPotState:init(player, dungeon)
  self.entity = player
  self.dungeon = dungeon

  -- render offset for spaced character sprite
  self.entity.offsetY = 5
  self.entity.offsetX = 0

  local direction = self.entity.direction

  self.entity:changeAnimation('lift-pot-' .. tostring(direction))
end

function PlayerLiftPotState:update(dt)
  if self.entity.currentAnimation.timesPlayed > 0 then
    self.entity.currentAnimation.timesPlayed = 0

    for k, object in pairs(self.dungeon.currentRoom.objects) do
      if object.type == 'pot' then
        local distX = math.abs(self.entity.x - object.x)
        local distY = math.abs(self.entity.y - object.y)
        if math.sqrt((distX ^ 2) + ( distY ^ 2)) < 24 then
          self.entity.carryingPot = object
        end
      end
    end
  end
  self.entity:changeState('walk-pot')
end

function PlayerLiftPotState:render()
    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.entity.x - self.entity.offsetX), math.floor(self.entity.y - self.entity.offsetY))
end
