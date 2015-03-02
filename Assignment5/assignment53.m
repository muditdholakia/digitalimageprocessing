clc;
clear all;
close all;
A = imread('concordaerial.png');
Ref = imread('concordorthophoto.png');
B=imhistmatch(A,Ref);
%subplot(1,3,1)
figure,imshow(A);title('ORIGINAL')
%subplot(1,3,2)
figure,imshow(Ref);title('REFERENCE')
%subplot(1,3,3)
figure,imshow(B);title('MATCHED IMAGE')