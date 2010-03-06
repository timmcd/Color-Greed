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
      content_update = function (self)
      end
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

function Window:_update()

   self:content_update()

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
