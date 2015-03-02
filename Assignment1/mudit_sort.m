function [ sorted ] = mudit_sort( array,ln,tp )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

if tp==1
for i=1:ln
    for j=1:ln-1
    if array(j)>array(j+1)
        temp=array(j)
        array(j)=array(j+1)
        array(j+1)=temp
    end
    end
    
        
end
elseif tp==2
for i=1:ln
    for j=1:ln-1
    if array(j)<array(j+1)
        temp=array(j)
        array(j)=array(j+1)
        array(j+1)=temp
    end
    end
    
        
end
end


sorted=array
end

