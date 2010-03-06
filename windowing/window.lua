-- Working on the windows for GUI. -Timothy

Window = {
   position = {0, 0},
   color = {255, 0, 0, 0},
   caption = "PLACE HOLDER",
   size = {50, 50}
}

function Window:new(args)
   self.love = args.loveLib

   if args.color then
      self.color = args
   end

   if args.position then
      self.position = args.position
   end

   if args.size then
      self.size = args.size
   end

   if args.caption then
      self.caption = caption
   end
   
   return self
end

function Window:draw(...)
   if arg[1] then
      self.position = arg[1]
   end

   color = self.love.graphics.setColor(unpack(self.color))

   self.headerSize = {10, self.size[2]}
   self.headerPosition = {self.position[1] + 10, self.position[2]}
   
   self.love.graphics.rectangle(self.love.graphics.line, unpack(self.headerPosition), unpack(self.headerSize))
   self.love.graphics.rectangle(self.love.graphics.fill, unpack(self.position), unpack(self.size))
   
end