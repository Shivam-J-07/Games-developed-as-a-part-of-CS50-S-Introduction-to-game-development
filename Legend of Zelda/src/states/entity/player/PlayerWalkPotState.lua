PlayerWalkPotState = Class {__includes = BaseState}

function PlayerWalkPotState:init(player, dungeon)
  self.entity = player
  self.dungeon = dungeon

  -- render offset for spaced character sprite
  self.entity.offsetY = 5
  self.entity.offsetX = 0

  self.entity:changeAnimation('walk-pot-' .. self.entity.direction)
end

function PlayerWalkState:enter(params)
  self.entity.currentAnimation:refresh()
end

function PlayerWalkPotState:update(dt)

  if love.keyboard.isDown('left') then
      self.entity.carryingPot.x = self.entity.x - 2
      self.entity.carryingPot.y = self.entity.y - 9
      self.entity.direction = 'left'
      self.entity:changeAnimation('walk-pot-left')
  elseif love.keyboard.isDown('right') then
      self.entity.carryingPot.x = self.entity.x + 2
      self.entity.carryingPot.y = self.entity.y - 9
      self.entity.direction = 'right'
      self.entity:changeAnimation('walk-pot-right')
  elseif love.keyboard.isDown('up') then
      self.entity.carryingPot.y = self.entity.y - 9
      self.entity.carryingPot.x = self.entity.x
      self.entity.direction = 'up'
      self.entity:changeAnimation('walk-pot-up')
  elseif love.keyboard.isDown('down') then
      self.entity.carryingPot.y = self.entity.y - 9
      self.entity.carryingPot.x = self.entity.x
      self.entity.direction = 'down'
      self.entity:changeAnimation('walk-pot-down')
  elseif self.entity.carryingPot ~= nil then
      self.entity:changeState('walk-pot-idle')
  end

  EntityWalkState.update(self, dt)

  if love.keyboard.wasPressed('f') then
    self.entity:changeState('throw-pot')
  end

end

function PlayerWalkPotState:render()
    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.entity.x - self.entity.offsetX), math.floor(self.entity.y - self.entity.offsetY))
end
