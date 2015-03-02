clc;
close all;
clear all;
I=imread('mob2.jpg');
I = rgb2gray(I);
figure,imshow(I);
I = imcomplement(I);
sz=size(I);
I=I>128;
[a, b] = bwlabel(I,8);
for i=1:sz(1)
    for j=1:sz(2)
        if a(i,j)>0
        ni(i,j)=1;
        else
            ni(i,j)=0;
        end
    end
end
figure,imshow(ni);