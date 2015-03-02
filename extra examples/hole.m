clear all;
clc;
close all;




RGB = imread('hole.tif');

GRAY = rgb2gray(RGB);
threshold = graythresh(GRAY);
originalImage = im2bw(GRAY, threshold);

originalImage = bwareaopen(originalImage,250);
se = strel('disk', 10); %# structuring element
closeBW = imclose(originalImage,se);

imshow(closeBW);