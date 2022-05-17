require("player")
require("ball")
require("ai")
require("background")

function love.load()
    Player:load()
    Ball:load()
    AI:load()
    Background:load()

    Score = {
        player = 0,
        ai = 0
    }
    font = love.graphics.newFont(30)
    sound = love.audio.newSource("assets/pong.wav", "static")
end

function love.update(dt)
    Player:update(dt)
    Ball:update(dt)
    print(Ball.speed)
    AI:update(dt)
    Background:update(dt)
end

function love.draw()
    Background:draw()
    Player:draw()
    Ball:draw()
    AI:draw()
    drawScore()
end

function drawScore()
    love.graphics.setFont(font)
    love.graphics.print("Player: " .. Score.player, 50, 50)
    love.graphics.print("AI: " .. Score.ai, 1000, 50)
end

function checkCollision(a, b)
    if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
        love.audio.play(sound)
        Ball.speed = Ball.speed + 2
        return true
    end
    return false
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end
