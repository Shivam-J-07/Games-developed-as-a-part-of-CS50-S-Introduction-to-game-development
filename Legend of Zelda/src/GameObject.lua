--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

GameObject = Class{}

function GameObject:init(def, x, y)
    -- string identifying this object type
    self.type = def.type

    self.texture = def.texture
    self.frame = def.frame or 1

    -- whether it acts as an obstacle or not
    self.solid = def.solid

    self.defaultState = def.defaultState
    self.state = self.defaultState or nil
    self.states = def.states or nil

    -- dimensions
    self.x = x
    self.y = y
    self.width = def.width
    self.height = def.height

    self.beingthrown = false

    -- default empty collision callback
    self.onCollide = function() end
end

function GameObject:update(dt)

end

function GameObject:render(adjacentOffsetX, adjacentOffsetY)
  if self.state ~= nil then
    love.graphics.draw(gTextures[self.texture], gFrames[self.texture][self.states[self.state].frame],
        self.x + adjacentOffsetX, self.y + adjacentOffsetY)
  else
    love.graphics.draw(gTextures[self.texture], gFrames[self.texture][self.frame],
        self.x + adjacentOffsetX, self.y + adjacentOffsetY)
  end
end
