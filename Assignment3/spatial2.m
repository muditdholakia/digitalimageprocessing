I=uigetfile('*.*','Select the Image');
I=imread(I);
[r c] = size(I);
a=[1 3 7 15 31 63 127 255];
for i=1:8
    num=i
L1 =a(i) ; %total number of levels
y1 = uint8(255/L1); %number of gray shades per level
x1 = 0:y1:255; %gray levels in output image
I1 = zeros(r,c);
for i = 1:1:r
for j = 1:1:c
k = uint8(I(i,j)/y1);
k = k+1;
if (k > L1+1)
k = k-1;
end
I1(i,j) = x1(k);
end
end

subplot(2,4,num)
imshow(uint8(I1));title([num2str(num),' bit image']);
end