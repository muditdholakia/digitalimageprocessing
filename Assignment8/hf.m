clc;
close all;
clear all;
I=imread('hole.tif');
figure,imshow(I);
I = imcomplement(I);
sz=size(I);
I=I>128;
[a, b] = bwlabel(I,8);
ni=ones(sz(1),sz(2));

for i=1:sz(1)
    for j=1:sz(2)
        if a(i,j)>0
        ni(i,j)=1;
        else
            ni(i,j)=0;
        end
    end
end
for i=1:sz(1)
    for j=1:sz(2)
        if a(i,j)>1
        ni(i,j)=1;
        else
            ni(i,j)=0;
        end
    end
end
I=imcomplement(I);
for i=1:sz(1)
    for j=1:sz(2)
        if ni(i,j)>0
        I(i,j)=I(i,j)+ni(i,j);
        end
    end
end

figure,imshow(ni);

figure,imshow(I);