function love.load()

end

function love.draw()
  
end

function love.update(dt)
end

function printtable(t)
  for i = 1,#t do
    printanyint(t[i],75*i)
  end
end

function printanyint(tec,down)
  local table = {}
  local i,temp2 = 1,tec 
  local temp
  while temp2 > 0 do
    table[i] = temp2 % 10
    temp2 =math.floor( temp2 /10)
    i = i+1
  end
  k=#table
  j=0
  print(k)
  for len = k, 1, -1 do
    printint(table[k],j + 100 * j, down)
    k = k - 1
    j = j + 1
  end

end

function printtwoint(n)
  printint(math.floor(n/10), 0)
  print(n/10)
  printint(n%10,100)
  print(n%10)
end
function printint(n, nexti,down)
  if n < 10 then
    if n == 1 then
      one(100 + nexti,100+down)
    elseif n ==2 then
      two(100 + nexti,100+down)
    elseif n ==3 then
      three(100 + nexti,100+down)
    elseif n ==4 then
      four(100 + nexti,100+down)
    elseif n ==5 then
      five(100 + nexti,100+down)
    elseif n ==6 then
      six(100 + nexti,100+down)
    elseif n ==7 then
      seven(100 + nexti,100+down)
    elseif n ==8 then
      eight(100 + nexti,100+down)
    elseif n ==9 then
      nine(100 + nexti,100+down)
    elseif n ==0 then
      zero(100 + nexti,100+down)
    end
  else printtwoint(n) end
end


function zero(x,y)
  local vertices = {x,y,x+40,y,x+40,y+60,x,y+60}
  love.graphics.polygon('line',vertices)
end
function one(x,y)
  local vertices = {x+20,y+20,x+40,y,x+40,y+60}
  love.graphics.line(unpack(vertices))
end
function two(x,y)
  local vertices = {x,y,x+40,y,x+40,y+30,x,y+30,x,y+60,x+40,y+60}
  love.graphics.line(unpack(vertices))
end

function three(x,y)
  local vertices = {x,y, x+40,y ,x+40,y+30, x,y+30, x+40,y+30, x+40,y+60, x,y+60}
  love.graphics.line(unpack(vertices))
  love.graphics.line(x,y+30,x+40,y+30)
end

function four(x,y)
  local vertices = {x,y,x,y+30,x+30,y+30,x+30,y,x+30,y+60}
  love.graphics.line(vertices)
  love.graphics.line(x+30,y,x+30,y+60)
end

function five(x,y)
  local vertices = {x+40,y,x,y,x,y+30,x+40,y+30,x+40,y+60,x,y+60}
  love.graphics.line(vertices)
end

function six(x,y)
  local vertices = {x+40,y,x,y,x,y+30,x+40,y+30,x+40,y+60,x,y+60}
  love.graphics.line(vertices)
  love.graphics.line(x,y+30,x,y+60)
end

function seven(x,y)
  local vertices = {x,y,x+40,y,x,y+60}
  love.graphics.line(vertices)
end

function eight(x,y)
  local vertices = {x,y,x+40,y,x+40,y+60,x,y+60}
  love.graphics.polygon('line',vertices)
  love.graphics.line(x,y+30,x+40,y+30)
end

function nine(x,y)
  local vertices = {x+40,y,x,y,x,y+30,x+40,y+30,x+40,y+60,x,y+60}
  love.graphics.line(vertices)
  love.graphics.line(x+40,y,x+40,y+60)
end

