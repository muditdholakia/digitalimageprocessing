

 close all
 clear all
 clc
% 
% %%%%%%%%%%%% read an image
% 
I = imread('image.jpg');


[Ix,Iy,Iz]=size(I);
if Ix>400&Iy>300
    %%%%%%%%%%%%%%%% %reducing the scale of image, let the high is 400
    I=imresize(I,[400,Iy*400/Ix],'nearest');
end
figure
imshow(I)
title('Original Image')

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Face detection 
I=double(I);             %converting the integer into decimal fraction
[hue,s,v]=rgb2hsv(I);    %converting RGB space into HSV space
cb=0.148*I(:,:,1)-0.291*I(:,:,2)+0.439*I(:,:,3)+128;%converting RGB space into YCrCb space
cr=0.439*I(:,:,1)-0.368*I(:,:,2)-0.071*I(:,:,3)+128;  
[w h]=size(I(:,:,1)); %size of the image 

%%%%%%%%%%%%%%%%%%%%% 
for i=1:w
    for j=1:h 
        % segmenting the face colour areas      
        if  145<=cr(i,j)&cr(i,j)<=165&145<=cb(i,j)&cb(i,j)<=180&0.01<=hue(i,j)&hue(i,j)<=0.15      
            segment(i,j)=1; %skin areas        
        else       
            segment(i,j)=0;    
        end    
    end
end


%%%%%%%%%%%%%%% processing on the detected areas
skin=segment;
% removing small connected pixels
skin=bwareaopen(skin,round(w*h/900));
%dilating
se=strel('disk',5);
skin=imdilate(skin,se);        

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%display skin areas 
im(:,:,1)=I(:,:,1).*skin;   
im(:,:,2)=I(:,:,2).*skin; 
im(:,:,3)=I(:,:,3).*skin; 

% %%%%%%%%%%%%%%%%%%%%%%%%%% detection of face object
BW = skin;
%%%%%%%%%%%%%%%%%%%%%% marking the connected areas
L = bwlabel(BW,8);

%%%%% calculating acreage of every connected area and converting the dataof cell into array
BB  = regionprops(L, 'BoundingBox');
BB1=struct2cell(BB);
%saving the begining point of connected frame and its high and wide
BB2=cell2mat(BB1);
figure,imshow(uint8(I));
title('Human Skins are Detected !');

%%%%%%%%%%%%%%%%%%%%% show the target in rectangular frame
[s1 s2]=size(BB2);
for k=3:4:s2-1
    %%%%%%%%%%%%%%%%BB2(1,k)wide£¬BB2(1,k+1)high
    if (BB2(1,k)/BB2(1,k+1)) < 1.8 &&....
        (BB2(1,k)/BB2(1,k+1)) > 0.4 &&....
         (BB2(1,k)*BB2(1,k+1)) > 1000
     %%% considering the areas which have 0.4<W/H<1.8 and their pixels acreage is bigger than 1000 as face
     hold on;
     rectangle('Position',[BB2(1,k-2),BB2(1,k-1),BB2(1,k),BB2(1,k+1)],'EdgeColor','r' )
     % RED RECTANGLE WILL SURROUND THE SKIN
    end
end



