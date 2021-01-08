PlayerThrowPotState = Class {__includes = BaseState}

function PlayerThrowPotState:init(player, dungeon)
  self.entity = player
  self.dungeon = dungeon

  -- render offset for spaced character sprite
  self.entity.offsetY = 5
  self.entity.offsetX = 0

  self.entity:changeAnimation('throw-pot-' .. self.entity.direction)

  self.projectile = nil
end

function PlayerThrowPotState:update(dt)

  if self.entity.currentAnimation.timesPlayed > 0 then
    self.entity.currentAnimation.timesPlayed = 0
    self.entity:changeAnimation('idle-' .. self.entity.direction)
  end

  if self.projectile == nil then
    self.entity.carryingPot.beingthrown = true
    self.projectile = Projectile(self.entity.carryingPot, TILE_SIZE*4, self.entity.direction)
  end

  self.projectile:update(dt)

  if self.projectile.motionComplete then
    self.entity.carryingPot.beingthrown = false
    for k, object in pairs(self.dungeon.currentRoom.objects) do
      if object == self.entity.carryingPot then
        table.remove(self.dungeon.currentRoom.objects, k)
        gSounds['pot-break']:play()
      end
    end
    self.entity.carryingPot = nil
    self.entity:changeState('idle')
  end

end

function PlayerThrowPotState:render()
    local anim = self.entity.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.entity.x - self.entity.offsetX), math.floor(self.entity.y - self.entity.offsetY))
end
