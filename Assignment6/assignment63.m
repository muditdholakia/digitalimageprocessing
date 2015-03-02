clc;
clear all;
close all;
I=imread('lena.jpg');
s=fspecial('sobel');
l=fspecial('laplacian');
p=fspecial('prewitt');

sb=imfilter(I,s);
lp=imfilter(I,l);
pw=imfilter(I,p);

figure,imshow(sb);title('Sobel operator in fspecial()')
figure,imshow(lp);title('Laplacian operator in fspecial()')
figure,imshow(pw);title('Prewitt operator in fspecial()')