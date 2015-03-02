clear all;
clc;
close all;



subplot(2,2,1);
I = imread('coins.png');
imshow(I);
title('Original');
    
subplot(2,2,2);
BW = I > 100;
imshow(BW);
title('Binary');
    
subplot(2,2,3);
CH = bwconvhull(BW);
imshow(CH);
title('Union Convex Hull');
    
subplot(2,2,4);
CH_objects = bwconvhull(BW,'objects');
imshow(CH_objects);
title('Objects Convex Hull');