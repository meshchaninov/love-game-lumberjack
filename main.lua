require("player")   
require("wood")
require("score")
require("game_over")
require("time_pill")

function love.load()
    WINDOW_WIDTH = love.graphics.getWidth()
    WINDOW_HEIGHT = love.graphics.getHeight()
    TILE_SIZE = 32
    SCALE = 1.8
    BEGIN_TIME = love.timer.getTime()
    HIGH_SCORE = 0
    love.graphics.setBackgroundColor(33, 66, 99)

    wood = love.graphics.newImage('assets/wood.png')
    branch = love.graphics.newImage('assets/branch.png')
    background = love.graphics.newImage("assets/background.png")

    font = love.graphics.newFont('fonts/font.ttf', 20)

    initPlayer(
        WINDOW_WIDTH / (2 * SCALE) - TILE_SIZE , 
        WINDOW_WIDTH / (2 * SCALE) + TILE_SIZE, 
        TILE_SIZE*8, 
        love.graphics.newImage("assets/player.png"),
        love.graphics.newImage("assets/dead_player.png")
    )
    initWoodGrid()
    initScore(
        WINDOW_WIDTH / SCALE - TILE_SIZE,
        TILE_SIZE,
        font
    )
    initGameOver(
        WINDOW_WIDTH / (3 * SCALE),
        WINDOW_HEIGHT / (2 * SCALE),
        font
    )
    initTimePill(
        TILE_SIZE,
        TILE_SIZE,
        TILE_SIZE,
        TILE_SIZE / 2
    )

end

function setSuperTime()
    local score = getScore()
    if score > 0 and score % 100 == 0 then
        addSuperBonusTime()
    end
end

function love.update(dt)
    setTimePill(BEGIN_TIME)
    if isTimesLeft() then
        setGameOver(true)
    end
    setSuperTime()
end

function collisionCheck()
    local gridPosition = getCurrentGridPosition()
    local playerPosition = getCurrentPlayerPosition()

    if (gridPosition[1] == 1 and playerPosition == PLAYER_LEFT) or 
        (gridPosition[2] == 1 and playerPosition == PLAYER_RIGHT) then
            setGameOver(true)
    end
end

function setNewGame()
    setGameOver(false)
    newScore()
    resetTimePill()
    BEGIN_TIME = love.timer.getTime()
end

function love.keypressed(key)
    local gameOverState = getGameOverState()
    function _tick()
        if not gameOverState then
            increaseScore()
            pullWoodGrid()
            collisionCheck()
            addBonus()
        end

    end
    if key == "left" then
        changePosition(PLAYER_LEFT)
        _tick()
    elseif key == "right" then
        changePosition(PLAYER_RIGHT)
        _tick()
    elseif key == "escape" then
        love.event.push("quit")
    elseif key == "space" then
        setNewGame()
    end
end

function love.draw(dt)
    love.graphics.draw(background)
    love.graphics.scale(SCALE, SCALE)
    local isGameOver = getGameOverState()
    if not isGameOver then
        drawWoodGrid(wood, branch)
        drawScore()
        drawTimePill()
        drawPlayer()
    else 
        drawGameOver(getScore())
        drawPlayer(true)
    end
end