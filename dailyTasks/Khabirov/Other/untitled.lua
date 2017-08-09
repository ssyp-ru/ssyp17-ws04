local inspect=require "lib/inspect"
math.randomseed(os.time());
mass={}--100 rand | 1/3--По убыв ост по возр послед с перв.
for i=1, 10 do
	mass[i]=math.random(1,100);
end

print(inspect(mass));

for i=0, #mass do
	for j=3, #mass-(#mass%3)*2, 3 do
		if (mass[j]<mass[j+3]) then
			mass[j],mass[j+3] = mass[j+3], mass[j];
		end
	end
end


for i=0, #mass do
	for j=1, #mass-1 do
		if (j%3~=0) then
			if((j+1)%3 == 0) then
				if mass[j]>mass[j+2] then
					mass[j],mass[j+2] = mass[j+2], mass[j];
				end
			else
				if(mass[j]>mass[j+1]) and ((j+1)%3 ~= 0) then
					mass[j],mass[j+1] = mass[j+1], mass[j];
				end
			end
		end
	end
end


print('\n');

mass[1],mass[#mass]=mass[#mass] ,mass[1];


print("\n"..inspect(mass));