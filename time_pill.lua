TIME_PILL_LEFT_BEGIN = 10000
TIME_PILL_MAX_STEP = 20
TIME_PILL_SUPER_BONUS_TIME = 1000

time_pill = {
	left_ms = TIME_PILL_LEFT_BEGIN,
	bonus = 1000,
	step = 0,
	x = nil,
	y = nil,
	max_width = nil,
	height = nil
}

function initTimePill(x, y, max_width, height)
	time_pill.x = x
	time_pill.y = y
	time_pill.max_width = max_width
	time_pill.height = height
end

function addBonus()
	if time_pill.step < TIME_PILL_MAX_STEP then
		time_pill.step = time_pill.step + 1
	end
	local bonus = time_pill.bonus / math.pow(time_pill.step, 1/2)
	time_pill.left_ms = time_pill.left_ms + bonus
end

function resetTimePill()
	time_pill.step = 0
	time_pill.left_ms = TIME_PILL_LEFT_BEGIN
end

function setTimePill(beginTime)
	time_pill.left_ms = math.floor(time_pill.left_ms - (love.timer.getTime() - beginTime))
end

function addSuperBonusTime()
	time_pill.left_ms = time_pill.left_ms + TIME_PILL_SUPER_BONUS_TIME
end

function isTimesLeft()
	if time_pill.left_ms < 0 then
		return true
	else
		return false
	end
end


function drawTimePill()
	local width = time_pill.max_width * (1 - (TIME_PILL_LEFT_BEGIN - time_pill.left_ms) / TIME_PILL_LEFT_BEGIN)
	love.graphics.setColor(255,0,0)
	love.graphics.rectangle("fill", time_pill.x, time_pill.y, width, time_pill.height)
	love.graphics.setColor(255,255,255)
end