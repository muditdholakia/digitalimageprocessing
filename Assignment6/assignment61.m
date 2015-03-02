clc;
clear all;
close all;
I=imread('lena.jpg');
imshow(I);
h=fspecial('sobel');
v=(fspecial('sobel'))';
hor=imfilter(I,h);
ver=imfilter(I,v);

final=hor+ver;
figure,imshow(final);