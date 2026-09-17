function love.load()
    boneco = {
        x = 350,
        y = 250,
        velocidade = 200,
        corR = 1, corG = 1, corB = 1
    }
 
    montanhaLonge = { x = 0, velocidade = 20 }
    montanhaPerto = { x = 0, velocidade = 80 }
end
 
function love.update(dt)
    if love.keyboard.isDown("right") then
        boneco.x = boneco.x + boneco.velocidade * dt
    end
    if love.keyboard.isDown("left") then
        boneco.x = boneco.x - boneco.velocidade * dt
    end
    if love.keyboard.isDown("up") then
        boneco.y = boneco.y - boneco.velocidade * dt
    end
    if love.keyboard.isDown("down") then
        boneco.y = boneco.y + boneco.velocidade * dt
    end
 
    local larguraTela = love.graphics.getWidth()
    local alturaTela = love.graphics.getHeight()
    boneco.x = math.max(0, math.min(larguraTela - 50, boneco.x))
    boneco.y = math.max(25, math.min(alturaTela - 70, boneco.y))
 
    montanhaLonge.x = montanhaLonge.x - montanhaLonge.velocidade * dt
    if montanhaLonge.x <= -900 then
        montanhaLonge.x = montanhaLonge.x + 900
    end
 
    montanhaPerto.x = montanhaPerto.x - montanhaPerto.velocidade * dt
    if montanhaPerto.x <= -700 then
        montanhaPerto.x = montanhaPerto.x + 700
    end
end
 
function love.draw()
    love.graphics.clear(0.1, 0.1, 0.15)
 
    love.graphics.setColor(0.25, 0.25, 0.4)
    love.graphics.rectangle("fill", montanhaLonge.x, 400, 900, 200)
    love.graphics.rectangle("fill", montanhaLonge.x + 900, 400, 900, 200)
 
    love.graphics.setColor(0.35, 0.2, 0.45)
    love.graphics.rectangle("fill", montanhaPerto.x, 450, 700, 150)
    love.graphics.rectangle("fill", montanhaPerto.x + 700, 450, 700, 150)
 
    love.graphics.setColor(1, 0.8, 0)
    love.graphics.circle("fill", 100, 100, 40)
 
    love.graphics.setColor(0, 0.7, 1)
    love.graphics.rectangle("fill", 200, 70, 60, 60)
 
    love.graphics.setColor(1, 0.3, 0.3)
    love.graphics.line(320, 70, 380, 130)
 
    love.graphics.setColor(0.4, 1, 0.4)
    love.graphics.polygon("fill", 450,70, 480,130, 420,130)
 
    love.graphics.setColor(boneco.corR, boneco.corG, boneco.corB)
    love.graphics.rectangle("fill", boneco.x, boneco.y, 50, 70)
    love.graphics.circle("fill", boneco.x + 25, boneco.y - 20, 25)
 
    love.graphics.setColor(1, 1, 1)
    love.graphics.print(
        "Use as SETAS para andar. Clique com o MOUSE para trocar a cor!",
        20, 20
    )
end
 
function love.mousepressed(x, y, botao)
    if botao == 1 then
        boneco.corR = 0.3 + love.math.random() * 0.7
        boneco.corG = 0.3 + love.math.random() * 0.7
        boneco.corB = 0.3 + love.math.random() * 0.7
    end
end