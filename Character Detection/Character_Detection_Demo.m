clc;
clear all;
close all;
 
%Read iamge...


[imgFileName, imgfolder] = uigetfile({'*.jpg;*.bmp;*.tif;*.png;*.gif','IMAGE Files (*.jpg,*.bmp,*.gif,*.png*.tif)'}, 'Select an Image'); 
fullImageFileName = fullfile(imgfolder, imgFileName);
 I = imread(fullImageFileName);
figure,imshow(I);

%Convert to grayscale..

Igray = rgb2gray(I);
figure,imshow(Igray);

%Convert to binary
Ibw = im2bw(Igray,graythresh(Igray));
figure,imshow(Ibw);

Iedge = edge(uint8(Ibw));
figure,imshow(Iedge);

se = strel('square',2);
Iedge2 = imdilate(Iedge,se);
figure,imshow(Iedge2);


%Fill holes

Ifill = imfill(Iedge2,'holes');
figure,imshow(Ifill);

%Count letter in text
[Ilabel, num] = bwlabel(Ifill);
disp(num);

%Calculate region property..
Iprops = regionprops(Ilabel);

%Set box properties into variable..
Ibox = [Iprops.BoundingBox];

%Reshape 1-D array..
Ibox= reshape(Ibox,[4 num]);

Iboxtemp = [ ];
count = 1;

for i = 1:num
    flag = 0;
    for j = 1:num
        
        if ((Ibox(1,j) <= Ibox(1,i) && Ibox(2,j) <= Ibox(2,i) && (Ibox(2,i)+Ibox(4,i)) <= (Ibox(2,j)+Ibox(4,j)) && (Ibox(1,i) + Ibox(3,i)) <= (Ibox(1,j) + Ibox(3,j))))&&(i~=j)
           flag = 1;
           
        end
    end
    
    if flag == 0
         Iboxtemp(:,count) = Ibox(:,i);
           count = count+1;
    end
    
        
end

Iboxtemp2 = Ibox;
Ibox = Iboxtemp;
%Ibox = Iboxtemp2

imshow(I);

[x1 y1] = size(Ibox);

%Draw bounding boxes for each letter..

hold on;
for cnt= 1:y1
    rectangle('position',Ibox(:,cnt),'edgecolor','g');
end
title('Output Iamge');
figure,imshow(I);


hold on;
for cnt= 1:num
    rectangle('position',Iboxtemp2(:,cnt),'edgecolor','b');
end
title('Original Image');
 
[m,n]=size(I);

fnamechar = '0001.jpg';

    for j=1:y1
        
 k1 = imcrop(Igray,[ Ibox(1,j) Ibox(2,j) Ibox(3,j) Ibox(4,j)]);
%    figure;imshow(k1)
% Path is required to change as per your computer
filename = fullfile('F:\Temp\VIDEO Processing STTP materail\STTP Material\TVR\Session1\Character Detection\','images\',fnamechar);

if fnamechar(4)==57

else
    
    fnamechar(4)=fnamechar(4)+1;
    
end
    
 %Write File 
imwrite(k1,filename);


    end
