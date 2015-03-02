num=input('ENTER THE NUMBER OF ELEMENTS TO BE SORTED:')
for i=1:num
    disp('ENTER THE ELEMENT NUMBER:')
    disp(i)
    ip=input(':')
    a(i)=ip
end
disp('For Ascending order press 1 for decending press 2:-->>ENTER:')
typ=input(':')
sorted=mudit_sort(a,num,typ)
disp('Sorted Sequence is:')
for i=1:num
    disp(sorted(i))
end
