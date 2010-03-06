-- Working on the windows for GUI. -Timothy

Window = {
   position = {0, 0},
   color = {255, 0, 0, 0},
   caption = "PLACE HOLDER",
   size = {50, 50}
}

function Window:new(args)

   if args.color then
      self.color = args.color
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

function Window:draw()

   color = love.graphics.setColor(self.color[1], self.color[2], self.color[3], self.color[4])

   self.headerSize = {10, self.size[2]}
   self.headerPosition = {self.position[1], self.position[2] - 10}
   
   love.graphics.rectangle("line", self.headerPosition[1], self.headerPosition[2], self.headerSize[1]+self.headerPosition[1], self.headerSize[2]+self.headerPosition[2])
   love.graphics.rectangle("fill", self.position[1], self.position[2], self.size[1]+self.position[1], self.size[2]+self.position[2])
   
end