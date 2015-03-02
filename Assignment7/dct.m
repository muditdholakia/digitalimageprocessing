clc
clear all
close all
I = imread('cameraman.tif');
I = im2double(I);
T = dctmtx(8);
B = blkproc(I,[8 8],'P1*x*P2',T,T');
mask = [1   1   1   1   0   0   0   0
        1   1   1   0   0   0   0   0
        1   1   0   0   0   0   0   0
        1   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0];
B2 = blkproc(B,[8 8],'P1.*x',mask);
I2 = blkproc(B2,[8 8],'P1*x*P2',T',T);
imshow(I), figure, imshow(I2)
imwrite(I2,'cmp.tif')

fileName = 'cameraman.tif';
rm1=rms(fileName);
fileInfo = imfinfo(fileName);
sz1 = fileInfo.FileSize;


fileName = 'cmp.tif';
rm2=rms(fileName);
fileInfo = imfinfo(fileName);
sz2 = fileInfo.FileSize;
display('Compression Ratio is:');
display(sz2/sz1);

display('ERROR IS');
er=(rm1*rm1)-(rm2*rm2);
er=sqrt(er);
display(er);
display('Relative Data Redundency');


I=imread('cameraman.tif');
if ~islogical(I)
  I = im2uint8(I);
end

% calculate histogram counts
p = imhist(I(:));

% remove zero entries in p 
p(p==0) = [];

% normalize p so that sum(p) is one.
p = p ./ numel(I);

E1 = -sum(p.*log2(p));


I=imread('cmp.tif');
if ~islogical(I)
  I = im2uint8(I);
end

% calculate histogram counts
p = imhist(I(:));

% remove zero entries in p 
p(p==0) = [];

% normalize p so that sum(p) is one.
p = p ./ numel(I);

E2 = -sum(p.*log2(p));

display('Relative Data Redundancy');
ex=E2-E1;
display(ex);
