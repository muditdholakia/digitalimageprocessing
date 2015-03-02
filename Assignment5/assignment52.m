clc;
clear all;
close all;
x=zeros(1,256);
x1=imread('lena.jpg');
figure,
subplot(2,2,1);
imshow(x1);title('ORIGINAL IMAGE')
subplot(2,2,2);
imhist(x1);
legend('Original');
J=histeq(x1);
subplot(2,2,3);
imshow(J);title('EQUALIZED IMAGE')
subplot(2,2,4);
imhist(J);
legend('Histo-equ');