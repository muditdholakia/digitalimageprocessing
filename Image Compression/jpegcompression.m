%% Source Code Downloaded from http://berksoysal.blogspot.com

%% Image Compression using DCT
clear all; close all; clc;


rate = input('Compression Quality % (1<x<100):  '); 
original=imread('IMG1.JPG');
% original = [ 154 123 123 123 123 123 123 136 ; 
%     192 180 136 154 154 154 136 110 ;
%     254 198 154 154 180 154 123 123 ;
%     239 180 136 180 180 166 123 123;
%     180 154 136 167 166 149 136 136 ;
%     128 136 123 136 154 180 198 154 ;
%     123 105 110 149 136 136 180 166;
%     110 136 123 123 123 136 154 136;]
original = double(original)/255;
rate=10000*rate;
%% Compression using Discrete Cosine Transform 
for i=1:3
im=original(:,:,i);

img_dct=dct2(im);
img_pow=(img_dct).^2;
img_pow=img_pow(:);
[B,index]=sort(img_pow);%no zig-zag
B=flipud(B);
index=flipud(index);
compressed_dct=zeros(size(im));

%%%% Determines Compression Quality

for k=1:rate
compressed_dct(index(k))=img_dct(index(k));
end
img_dct=idct2(compressed_dct);

RGB(:,:,i)=img_dct;

end % This loop is used because RGB images have 3 dimensions

%% PLOT
imshow(original)
title('Original image');
figure;
imshow(RGB);
title('DCT Compressed Image');

%% Save to File
imwrite(RGB, 'compressed.jpg');

%% If you liked the project, please leave a comment on the post. Thank you.
% Berk SOYSAL
