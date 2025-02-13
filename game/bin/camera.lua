camera = {}

function camera:load()
	self.x = 0
	self.y = 0
	self.speed = 9
	self.target = self

	self.drawn = false
end

function camera:set_target(target)
	self.target = target
end

function camera:update()
	local dx = self.target.x - self.x - gfx.res.x / 2
	local dy = self.target.y - self.y - gfx.res.y / 2
	self.x = self.x + dx / self.speed
	self.y = self.y + dy / self.speed

	self.drawn = false
end

function camera:draw()
	self.drawn = true
	lg.translate(-math.floor(self.x), -math.floor(self.y))
end

function camera:undraw()
	if self.drawn then
		self.drawn = false
		lg.translate(math.floor(self.x), math.floor(self.y))
	end
end