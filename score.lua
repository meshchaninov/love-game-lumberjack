score = {
	score = 0,
	x = nil,
	y = nil,
	font = nil,
	size = 14
}

function initScore(x, y, font)
	score.x = x
	score.y = y
	score.font = font or love.graphics.newFont(score.size)
end

function newScore()
	score.score = 0
end

function increaseScore()
	score.score = score.score + 1
end

function getScore()
	return score.score
end

function drawScore()
	love.graphics.setFont(score.font)
	love.graphics.setColor(0,0,0)
	love.graphics.print(score.score, score.x, score.y)
	love.graphics.setColor(1,1,1)
end