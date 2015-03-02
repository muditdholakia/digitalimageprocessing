num=input('ENTER NUMBER TO CHECK WHEATHER IT IS PRIME OR NOT::');
count=0;
for i=1:num
    if mod(num,i)==0
        count=count+1;
    else
        x=0;
    end
end
if count==2
    disp('IT IS A PRIME NUMBER.')
else
    disp('IT IS NOT A PRIME NUMBER.')
end
        