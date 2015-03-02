disp('Give the input 1.Example of if-else 2.Example of for loop 3.Example of while loop');
result = input('Enter Value of result:-')
if result==1 
    disp('THIS IS IF-ELSE');
elseif result==2
    for i=1:10
        disp('FOR LOOP');
    end
elseif result==3
    n=5;
x=1; i=1;
while i<=n
x=x*i;
i=i+1;
disp('WHILE LOOP');
end
fout = x;
else
    disp('INVALID CHOICE');
end 