require( "windowing/window.lua" )

window = nil

function love.load()
   -- Window object, with the new function. Takes a table with possibles being:
   -- -- color = { r, g, b, a } (rgba = 0..255)
   -- -- caption = "the caption as a string"
   -- -- position = { x, y }
   window = Window.new{ color = { 255, 255, 0, 255 }, caption = "Teh Window!" }
   -- Set the position
   window.x, window.y = 24, 30
   print(window.draw, Window.draw)
end

function love.update(dt)
   window:update(dt)
end

function love.draw()
   window:draw()
end

function love.mousepressed(x, y, button)
   window:mousedown(x, y, button)
end

function love.mousereleased(x, y, button)
   window:mouseup(x, y, button)
end
