clc;
close all;
clear all;
thr=input('Give the threshold value:-');
I = imread('lena.jpg');

I=I>thr;
figure,imshow(I);