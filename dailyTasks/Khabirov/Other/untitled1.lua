--Двумерный массив заполнить и вывести.(Размер с консоли)
-- Столбики через 1 сортировка
local inspect=require "lib/inspect"
math.randomseed(os.time());
local r=(io.read("*n"));
mass={};

for i=1, r do 
	mass[i]={};
	for j=1, r do
		mass[i][j]=math.random(0,9);		
	end
end
r=nil;
--Вывод
for i=1, #mass do
	print(inspect(mass[i]));
end

for k=1, #mass do
	for i=0, #mass  do 
		for j=1, #mass-1 do
			if (k%2==0) then--Условие сортировки если кратно 2, то от большего к меньшему, иначе от меньшего к большему  
				if (mass[j][k]<mass[j+1][k]) then--Если элемент 
					mass[j][k] ,mass[j+1][k] = mass[j+1][k] ,mass[j][k];			
				end
			else
				if (mass[j][k]>mass[j+1][k]) then
					mass[j][k] ,mass[j+1][k] = mass[j+1][k] ,mass[j][k];			
				end
			end
		end
	end
end

print("\n\n\n");

--Вывод
for i=1, #mass do
	print(inspect(mass[i]));
end

print("\n\n\n");

for i=1, #mass do
	print(mass[i][i].."\t"..mass[#mass-i+1][i]);
end

print("\n\n\n");

--for i=1, #mass do
--print(mass[#mass-i+1][i]);	
--end


for i=0, #mass do
	for j=1, #mass-1 do
		if (mass[j][j]>mass[j+1][j+1]) then
			mass[j][j], mass[j+1][j+1] = mass[j+1][j+1], mass[j][j];
		end
	end
end

--for i=1, #mass do
--	print(mass[i][i].."\t"..mass[#mass-i+1][i]);
--end

for i=0, #mass do
	for j=1, #mass-1 do
		if (mass[#mass-j+1][j]>mass[#mass-j][j+1]) then
			mass[#mass-j+1][j], mass[#mass-j][j+1] = mass[#mass-j][j+1], mass[#mass-j+1][j];
		end
	end
end


for i=1, #mass do
	print(mass[i][i].."\t"..mass[#mass-i+1][i]);
end
print("\n\n\n");
for i=1, #mass do
	print(inspect(mass[i]));
end