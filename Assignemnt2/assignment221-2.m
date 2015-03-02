% Read  grayscale, color images

clear all;
clc;
close all;

t1=imread('lena.jpg'); %Orignal img
max=0;
countz=0;
count1=0;
grayc=0;
colorc=0;
num=input('PRESS 1:LOGICAL 2:GRAYSCALE 3:COLORED::');
sz=size(t1);
disp(ndims(t1))

if ndims(t1)==3
    colorc=colorc+1;

elseif ndims(t1)==2
for i=1:sz(1)
    for j=1:sz(2)
      if t1(i,j)>1 & t1(i,j)<=255
          grayc=grayc+1;    
      end
    end
end
end

if num==3
    if colorc>0
        
        subplot(2,2,1)
       
        imshow(t1);
        t2=rgb2gray(t1);
        subplot(2,2,2)
        imshow(t2);
        t3=im2bw(t1);
        subplot(2,2,3)
        imshow(t3);
        title('ALL CONVERSIONS ARE POSSIBLE.')
    elseif (colorc==0) & (grayc>0)
       
        subplot(2,2,1)
        imshow(t1);
        t3=im2bw(t1);
        subplot(2,2,2)
        imshow(t3);
         title('HERE SELECTED IMAGE IS GRAYSCALE SO ONLY BINARY IS POSSIBLE.')
    elseif (colorc==0) & (grayc==0)
                subplot(2,2,1)
                imshow(t1);
    end
elseif num==2
    if colorc>0
        disp('INVALID IMAGE')
    elseif (colorc==0) & (grayc>0)
        subplot(2,2,1)
        imshow(t1);
        t3=im2bw(t1);
        subplot(2,2,2)
        imshow(t3);
        
        title('HERE SELECTED IMAGE IS GRAYSCALE SO ONLY BINARY IS POSSIBLE.')
    elseif (colorc==0) & (grayc==0)
                subplot(2,2,1)
                imshow(t1);
    end
elseif num==1
    if colorc>0
        disp('INVALID IMAGE')
    elseif (colorc==0) & (grayc>0)
        disp('INVALID IMAGE')
    elseif (colorc==0) & (grayc==0)
                subplot(2,2,1)
                imshow(t1);
                
        title('HERE SELECTED IMAGE IS BINARY SO NO HIGHER CONVERSIONS ARE POSSIBLE.')
    end
    
    
            
end
        
    



