PLAYER_LEFT = 0
PLAYER_RIGHT = 1

player = {
	leftX = nil,
	rightX = nil,
	y = nil, 
	position = PLAYER_LEFT,
	img = nil,
	deadImg = nil,
}

function initPlayer(leftX, rightX, y, img, deadImg)
	player.leftX = leftX
	player.rightX = rightX
	player.y = y
	player.img = img
	player.deadImg = deadImg
end

function changePosition(position) 
	player.position = position
end


function getCurrentPlayerPosition()
	return player.position
end

function drawPlayer(isDead) 
	if isDead then
    	love.graphics.draw(player.deadImg, (player.leftX - player.leftX) / 2 + player.leftX, player.y)
	elseif player.position == PLAYER_LEFT then
    	love.graphics.draw(player.img, player.leftX, player.y)
    elseif player.position == PLAYER_RIGHT then
    	love.graphics.draw(player.img, player.rightX, player.y, 0, -1, 1)
    end
end