clear all;
close all;
clc;

i=imread('erode.tif');
subplot(1,2,1)
imshow(i);title('original image');

s=strel('square',10);

p=imerode(i,s);
subplot(1,2,2)
imshow(p);title('erode image');
