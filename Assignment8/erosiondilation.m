clear all;
close all;
clc;

chs=input('PRESS 1. FOR EROSION:-2. FOR DILATION:-');
if chs==1
    
I=imread('erdl.tif');
SE1 = strel('diamond', 1);
SE2 = strel('square',33);
SE3 = strel('line',10,45);
SE4 = strel('disk',15);
SE5 = strel('rectangle',[10 10]);
eroded1 = imerode(I,SE1);
eroded2 = imerode(I,SE2);
eroded3 = imerode(I,SE3);
eroded4 = imerode(I,SE4);
eroded5 = imerode(I,SE5);
subplot(2,3,1);
imshow(I);title('ORIGINAL')
subplot(2,3,2);
imshow(eroded1);title('Diamond')
subplot(2,3,3);
imshow(eroded2);title('Square')
subplot(2,3,4);
imshow(eroded3);title('Line')
subplot(2,3,5);
imshow(eroded4);title('Disk')
subplot(2,3,6);
imshow(eroded5);title('Rectangle')

elseif chs==2
I=imread('erdl.tif');
SE1 = strel('diamond', 1);
SE2 = strel('square',33);
SE3 = strel('line',10,45);
SE4 = strel('disk',15);
SE5 = strel('rectangle',[10 10]);
dil1 = imdilate(I,SE1);
dil2 = imdilate(I,SE2);
dil3 = imdilate(I,SE3);
dil4 = imdilate(I,SE4);
dil5 = imdilate(I,SE5);
subplot(2,3,1);
imshow(I);title('ORIGINAL')
subplot(2,3,2);
imshow(dil1);title('Diamond')
subplot(2,3,3);
imshow(dil2);title('Square')
subplot(2,3,4);
imshow(dil3);title('Line')
subplot(2,3,5);
imshow(dil4);title('Disk')
subplot(2,3,6);
imshow(dil5);title('Rectangle')

end