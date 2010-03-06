require("windowing/window.lua")

function load()
   -- Window object, with the new function. Takes a table with possibles being:
   -- -- color = { r, g, b, a }
   -- -- caption = "the caption as a string"
   -- -- position = { x, y }
   -- THE ARGUMENT loveLib IS REQUIRED!
   args = { color = { 100, 0, 0, 0 }, caption = "Teh Window!", loveLib = }
   window = Window:new(args)
   -- Set the position
   window.position = {5, 5}
   -- Draw the window at it's current position
   window:draw()
   love.timer.sleep(5*1000)
   -- Change the position and draw
   window:draw(50, 50)
end

function update(dt)
end

function draw()
end