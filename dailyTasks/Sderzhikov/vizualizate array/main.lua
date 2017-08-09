require 'print'

function love.load()
  t = {10,88,55,121,22}
  a = {}
  -- table.sort(t)
--  reverse()
  sort(t)
end

function love.draw()
  love.graphics.print(t[1] .. ' ' .. t[2] .. ' ' .. t[3] .. ' ' .. t[4] .. ' ' .. t[5],100,100)
  printtable(t)
end

function love.update(dt)

end

function reverse()
  local i,j = 0,1
  for i = #t,1,-1 do
    a[j] = t[i]
    j=j+1
  end
end

function sort(t)
  local i,j = 1,1

  for i=1,#t-1 do
    cur = t[i]

    for j = i + 1, #t do
      print(t[j])

      if cur > t[j] then
        t[j], t[i]= t[i],t[j]
        print('proshel')
      end
    end

    i= i+1
  end
end