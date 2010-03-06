require("windowing/window.lua")

window = nil

function love.load()
   -- Window object, with the new function. Takes a table with possibles being:
   -- -- color = { r, g, b, a }
   -- -- caption = "the caption as a string"
   -- -- position = { x, y }
   -- THE ARGUMENT loveLib IS REQUIRED!
   args = { color = { 100, 0, 0, 0 }, caption = "Teh Window!", loveLib = love}
   window = Window:new(args)
   -- Set the position
   window.position = {5, 5}
end

function love.update(dt)
end

function love.draw()
   -- Change the position and draw
   window:draw(50, 50)
end