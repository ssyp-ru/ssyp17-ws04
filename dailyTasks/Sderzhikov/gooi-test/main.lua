require "gooi"
--gooi = gooi.gooi
function love.load()
  panelGrid = gooi.newPanel({x=0, y=0, w=love.graphics.getWidth(), h=love.graphics.getHeight(),layout = "game"})
  panelGrid:add(gooi.newJoy({size = 70}),       "b-l")
  panelGrid:add(gooi.newButton("Action 1"):setText("exit(net)"),     "b-r")
  panelGrid:add(gooi.newButton("Action 2"):setText("Nichego"),     "b-r")
end
function love.draw()
  gooi.draw()
end

function love.update(dt)
  gooi.update(dt)
end

