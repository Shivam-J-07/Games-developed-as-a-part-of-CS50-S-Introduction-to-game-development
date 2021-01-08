--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

Projectile = Class{}

function Projectile:init(object, distance, direction)
  self.pot = object
  self.distanceToTravel = distance
  self.direction = direction
  self.initalX = object.x
  self.initalY = object.y
  self.motionComplete = false
end

function Projectile:update(dt)
  if self.direction == 'up' then
    self.pot.y = self.pot.y - (POT_THROW_SPEED * dt)
    if (self.initalY - self.pot.y) > self.distanceToTravel then
      self.motionComplete = true
    end
  elseif self.direction == 'down' then
    self.pot.y = self.pot.y + (POT_THROW_SPEED * dt)
    if (self.pot.y - self.initalY) > self.distanceToTravel then
      self.motionComplete = true
    end
  elseif self.direction == 'right' then
    self.pot.x = self.pot.x + (POT_THROW_SPEED * dt)
    if (self.pot.x - self.initalX) > self.distanceToTravel then
      self.motionComplete = true
    end
  elseif self.direction == 'left' then
    self.pot.x = self.pot.x - (POT_THROW_SPEED * dt)
    if (self.initalX - self.pot.x) > self.distanceToTravel then
      self.motionComplete = true
    end
  end
end

function Projectile:render()

end
