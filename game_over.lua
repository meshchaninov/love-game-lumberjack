game_over = {
	state = false,
	text = "GAME OVER!\nYour Score: ",
	x = nil,
	y = nil,
	font = nil,
}

function initGameOver(x, y, font) 
	game_over.x = x
	game_over.y = y
	game_over.font = font or love.graphics.newFont(10) 
end

function setGameOver(state)
	game_over.state = state
end

function setNewGame()
	game_over.state = false
end

function getGameOverState()
	return game_over.state
end

function drawGameOver(score)
	love.graphics.setFont(game_over.font)
	love.graphics.setColor(0,0,0)
	love.graphics.print(game_over.text .. score, game_over.x, game_over.y)
	love.graphics.setColor(1,1,1)
end