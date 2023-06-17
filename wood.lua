grid = {}

function initWoodGrid()
    for i = 1, 9 do
        grid[i] = _randomPair()
    end
    grid[#grid] = {0, 1}

end

function _randomPair()
	num = love.math.random(1, 3)

	if num == 1 then
		return {1, 0}
	elseif num == 2 then
		return {0, 1}
	elseif num == 3 then
		return {0, 0}
	end
end

function pullWoodGrid()
	for i=#grid, 2, -1 do
		grid[i] = grid[i - 1]
	end
	grid[1] = _randomPair()
end

function getCurrentGridPosition()
    return grid[#grid]
end

function drawWoodGrid()
	 for i=1,#grid do
        local leftDraw = wood
        if grid[i][1] == 1 then
            leftDraw = branch
        elseif grid[i][1] == 0 then
            leftDraw = wood
        end

        local rightDraw = wood
        if grid[i][2] == 1 then
            rightDraw = branch
        elseif grid[i][2] == 0 then
            rightDraw = wood
        end

        love.graphics.draw(leftDraw, WINDOW_WIDTH / (2 * SCALE) - 32, 32 * (i - 1))
        love.graphics.draw(rightDraw, WINDOW_WIDTH / (2 * SCALE) + 32, 32 * (i - 1), 0, -1, 1)
    end
end