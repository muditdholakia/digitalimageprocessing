clear all;
close all;
clc;

chs=input('PRESS 1. FOR OPENING:-2. FOR CLOSING:-');
if chs==1
    
I=imread('erdl.tif');
s1=input('Enter StructuringElement for Erosion:1.diamond 2.square 3.lone 4.disk 5.rectangle::--');
if s1==1
SE = strel('diamond', 1);
elseif s1==2
SE = strel('square',33);
elseif s1==3
SE = strel('line',10,45);
elseif s1==4
SE = strel('disk',15);
elseif s1==5
SE = strel('rectangle',[10 10]);
end
eroded = imerode(I,SE);

s2=input('Enter StructuringElement for Dilation:1.diamond 2.square 3.lone 4.disk 5.rectangle::--');
if s2==1
SE = strel('diamond', 1);
elseif s2==2
SE = strel('square',33);
elseif s2==3
SE = strel('line',10,45);
elseif s2==4
SE = strel('disk',15);
elseif s2==5
SE = strel('rectangle',[10 10]);
end
dil = imdilate(eroded,SE);
subplot(1,3,1);
imshow(I);title('ORIGINAL')
subplot(1,3,2);
imshow(eroded);title('EROSION')
subplot(1,3,3);
imshow(dil);title('EROSION+DIALATION=OPENING')

elseif chs==2
    I=imread('erdl.tif');
s1=input('Enter StructuringElement for Dilation:1.diamond 2.square 3.lone 4.disk 5.rectangle::--');
if s1==1
SE = strel('diamond', 1);
elseif s1==2
SE = strel('square',33);
elseif s1==3
SE = strel('line',10,45);
elseif s1==4
SE = strel('disk',15);
elseif s1==5
SE = strel('rectangle',[10 10]);
end
dil = imdilate(I,SE);

s2=input('Enter StructuringElement for Erosion:1.diamond 2.square 3.lone 4.disk 5.rectangle::--');
if s2==1
SE = strel('diamond', 1);
elseif s2==2
SE = strel('square',33);
elseif s2==3
SE = strel('line',10,45);
elseif s2==4
SE = strel('disk',15);
elseif s2==5
SE = strel('rectangle',[10 10]);
end
eroded = imerode(dil,SE);

subplot(1,3,1);
imshow(I);title('ORIGINAL')
subplot(1,3,2);
imshow(dil);title('DILATION')

subplot(1,3,3);
imshow(eroded);title('DIALATION+EROSION=CLOSING')
end