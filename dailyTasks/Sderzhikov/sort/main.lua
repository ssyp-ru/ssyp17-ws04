
inspect = require "inspect"

function love.load()

  amount = 3


  a = {}

  t = {}
  randtable(t)
  sort(t)
  print("1-".. amount ..",vozrostanie: ")
  print(inspect(t))

  t = {}
  randtable(t)
  sort(t)
  reverse(t)
  print("1-".. amount ..",ubivanie: ")
  print(inspect(a)) 

  duckingfunction(t,a)
  print('duckingfunction:')
  print(inspect(t))

  t[1],t[#t] = t[#t],t[1]
  print('with reverse:')
  print(inspect(t))

  love.event.quit()
end

function reverse(t)
  local i,j,k = 0,1,1

  for i = #t,1,-1 do
    a[j] = t[i]
    j=j+1
  end
end

function sortone(t)
  local i,j = 1,1

  for i=1,#t-1 do
    cur = t[i]
    for j = i + 1, #t do
      if cur > t[j] then
        t[j], t[i]= t[i],t[j]
      end
    end

    i= i+1
  end
end

function randtable(t)
  local i
  for i = 1,amount do
    t[i] = love.math.random(1,100)
  end
end

function sort(t)
  local i
  for i=1,amount do
    sortone(t)
  end
end

function duckingfunction(t,a)
  local i
  for i = 1,amount,2 do
    if i == 1 then 
      table.insert(t,i,a[i])
    else
      table.insert(t,i+1,a[i])
    end
  end
end

