-- Working on the windows for GUI. -Timothy
-- Made Window into a class, and made it draw =D

Window = {}

function Window.new(args)

   local i = {
	x = 0,
	y = 0,
	scale = {1, 1},
      color = {255, 255, 255, 255},
      caption = "PLACE HOLDER",
      size = {500, 500},
      draw = Window._draw,
      update = Window._update,
      mousedown = Window._mousedown,
      mouseup = Window._mouseup,
      content_draw = function (self)
		     end,
      content_update = function (self, dt)
		       end,
      content = {},
      mo = {0, 0},
      ontarget = false,
   }

   if args.color then
      i.color = args.color
   end

   if args.position then
	i.x, i.y = unpack(args.position)
   end

   if args.size then
      i.size = args.size
   end

   if args.caption then
      i.caption = args.caption
   end

   return i
end

function Window._dragNdrop(x, y, sizex, sizey)

   sizex = sizex + x
   sizey = sizey + y

   if love.mouse.getX() >= x and love.mouse.getX() <= sizex and
      love.mouse.getY() >= y and love.mouse.getY() <= sizey then
      --
      return true
   end
   
end

function Window:_update(dt)

   local mp = {love.mouse.getPosition()}

   if self.ontarget then
      self.x, self.y = mp[1]+self.mo[1], mp[2]+self.mo[2]
   end

   self:content_update(dt)

end

function Window:_draw()

   self.headerSize = {self.size[1], 24}
   self.headerPosition = {self.x, self.y - self.headerSize[2]}

   love.graphics.setLineWidth(2)
   love.graphics.setLineStyle('smooth')

   love.graphics.setColor(unpack(self.color))
   love.graphics.rectangle("line", self.headerPosition[1], self.headerPosition[2], self.headerSize[1], self.headerSize[2])
   love.graphics.setColor(0,0,0,255)
   love.graphics.rectangle("fill", self.headerPosition[1], self.headerPosition[2], self.headerSize[1], self.headerSize[2])
   love.graphics.setColor(unpack(self.color))
   love.graphics.rectangle("line", self.x, self.y, self.size[1], self.size[2])
   love.graphics.rectangle("fill", self.x, self.y, self.size[1], self.size[2])

	self:content_draw()

   love.graphics.setColor(255,255,255,255)
   love.graphics.printf(self.caption, self.headerPosition[1]+8, self.headerPosition[2]+15, self.headerSize[1]*self.scale[1], "left")
   
end

function Window:_mousedown(x, y, button)
   if button == 'l'
         and x >= self.headerPosition[1]
         and y >= self.headerPosition[2]
         and x <= self.headerPosition[1]+self.headerSize[1]
         and y <= self.headerPosition[2]+self.headerSize[2] then
      self.mo = {self.x-x, self.y-y}
      self.ontarget = true
	end
end

function Window:_mouseup(x, y, button)
   if button == 'l' and self.ontarget then self.ontarget = false end
	if button == 'l' and self.toscale then self.toscale = false end
end
