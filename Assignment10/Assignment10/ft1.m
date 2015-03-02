clear all;
clc;
close all;

subplot(2,3,1);
f = imread('1.tif');
F = double(f);
imshow(F);
title('Original Image')
subplot(2,3,2);
F1 = fft2(F);
imshow(F1);
title('fft1 Image')
subplot(2,3,3);
FF = fftshift(F1);
imshow(FF, []);
title('fftshift Image')
subplot(2,3,4);
F2 = abs(FF);
imshow(F2, []);
title('absolute Image')
subplot(2,3,5);
F3 = log(1+F2);
imshow(F3, []);
title('Logtransformed Image')