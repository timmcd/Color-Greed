-- Working on the windows for GUI. -Timothy
-- Made Window into a class, and made it draw =D

Window = {}

function Window.new(args)

   local i = {
      position = {0, 0},
      color = {255, 255, 255, 255},
      caption = "PLACE HOLDER",
      size = {500, 500},
      draw = Window._draw,
      update = Window._update,
      content_draw = function (self)
		     end,
      content_update = function (self, dt)
		       end,
      content = {}
   }

   if args.color then
      i.color = args.color
   end

   if args.position then
      i.position = args.position
   end

   if args.size then
      i.size = args.size
   end

   if args.caption then
      i.caption = args.caption
   end

   return i
end

function Window:_update(dt)
   if love.mouse.isDown("l") then
      if love.mouse.getX() > self.headerPosition[1] and love.mouse.getX() < self.headerSize[1] and love.mouse.getY() > self.headerPosition[2] and love.mouse.getY() < self.headerSize[2] then
	 self.position[1], self.position[2] = love.mouse.getPosition()
      end
   end
	 

   self:content_update(dt)

end

function Window:_draw()

   self.headerSize = {self.size[1], 24}
   self.headerPosition = {self.position[1], self.position[2] - self.headerSize[2]}
   
   love.graphics.setLineWidth(2)
   love.graphics.setLineStyle('smooth')

   love.graphics.setColor(unpack(self.color))
   love.graphics.rectangle("line", self.headerPosition[1], self.headerPosition[2], self.headerSize[1], self.headerSize[2])
   love.graphics.setColor(0,0,0,255)
   love.graphics.rectangle("fill", self.headerPosition[1], self.headerPosition[2], self.headerSize[1], self.headerSize[2])
   love.graphics.setColor(unpack(self.color))
   love.graphics.rectangle("line", self.position[1], self.position[2], self.size[1], self.size[2])
   love.graphics.rectangle("fill", self.position[1], self.position[2], self.size[1], self.size[2])

   love.graphics.setColor(255,255,255,255)
   love.graphics.print(self.caption, self.headerPosition[1]+8, self.headerPosition[2]+15)

   self:content_draw()
   
end

function Window:content_draw()
   for i,v in ipairs(self.content) do
      x = v.position[1] + self.position[1]
      y = v.position[2] + self.position[2]
      v.draw(x, y)
   end
end
