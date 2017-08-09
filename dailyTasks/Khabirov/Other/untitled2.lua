local inspect=require "lib/inspect"
mass={};
for i=1, 9 do 
	mass[i]={};
	for j=1, 9 do
		mass[i][j]=i*j;		
	end
end

for i=1, #mass do
	print(inspect(mass[i]));
end