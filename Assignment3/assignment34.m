%clc
BW1=imread('mudit.jpg');
BW = im2bw(BW1, 1)
L = bwlabel(BW,4);
imshow(L)