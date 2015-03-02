clear all;
close all;
clc;

i=imread('open.tif');
subplot(1,2,1)
imshow(i);title('original image');

s=strel('disk',10);

p=imopen(i,s);
subplot(1,2,2)
imshow(p,[]);title('After opening');
