clc;
close all;
clear all;
I = imread('mudit.jpg');
I = rgb2gray(I);
figure,imshow(I);
I = imcomplement(I);
I=I>128;
[a, b] = bwlabel(I,8);
[c,d] = size(I);
I1 = zeros(c,d);
I2 = zeros(c,d);
I3 = zeros(c,d);
I4 = zeros(c,d);
I5 = zeros(c,d);
%for g = 1:b
for e = 1:c
    for f = 1:d
        if a(e,f) == 1
            I1(e,f) = I(e,f);
            
        elseif a(e,f) == 2
            I2(e,f) = I(e,f);
            
        elseif a(e,f) == 3
            I3(e,f) = I(e,f);
            
        elseif a(e,f) == 4
            I4(e,f) = I(e,f);
            
        elseif a(e,f) == 5
            I5(e,f) = I(e,f);
           
        end
    end
end
I1=imcomplement(I1);
I2=imcomplement(I2);
I3=imcomplement(I3);
I4=imcomplement(I4);
I5=imcomplement(I5);
imwrite(I1,'m.tif');
imwrite(I2,'u.tif');
imwrite(I3,'d.tif');
imwrite(I4,'i.tif');
imwrite(I5,'t.tif');
figure,imshow(I1);
figure,imshow(I2);
figure,imshow(I3);
figure,imshow(I4);
figure,imshow(I5);
