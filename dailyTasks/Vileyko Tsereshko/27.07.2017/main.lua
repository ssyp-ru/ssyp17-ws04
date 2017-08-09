m = {}

for i = 1, 20 do
	m[i] = 3
end

m[#m] = 2

function check (a, b)
	if a > b then
		return false
	else
		return true
	end
end

for i = 1, #m - 1 do
	--if m[i-1
	--if i+2 < #m then
		--if i % 2 == 0 then
			if check(m[i], m[i+1]) == false then
				m[i], m[i+1] = m[i+1], m[i]
			end
		--end
	--else
		--break
	--end
end

for i = 1, #m do
	print(m[i])
end