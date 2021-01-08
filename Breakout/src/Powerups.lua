Powerups = Class{}

function Powerups:init(skin)
  self.width = 16
  self.height = 16

  self.dx = 0
  self.dy = 30

  self.x = math.random(20, VIRTUAL_WIDTH - 36)
  self.y = -20

  self.inPlay = false
  self.skin = skin

  self.wasCollected = false
end

function Powerups:collides(target)
  if self.x + 1 > target.x + target.width or target.x - 1 > self.x + self.width then
      return false
  end

  if self.y > target.y + target.height or target.y > self.y + self.height - 2 then
      return false
  end

  return true
end

function Powerups:update(dt)
  self.y = self.y + self.dy * dt
end

function Powerups:render()
   love.graphics.draw(gTextures['main'], gFrames['powerups'][self.skin],
      self.x, self.y)
end
