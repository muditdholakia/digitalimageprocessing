clc;
clear all;
close all;
x=zeros(1,256);
x1=imread('lena.jpg');
[a b]=size(x1);
for i=1:a
    for j=1:b
        x(x1(i,j)+1)=x(x1(i,j)+1)+1;
    end
end
xx=1:1:256;
figure,plot(xx,x);
xlabel('Intensity');
ylabel('Number of pixels');
legend('Intensity distribution without imhist()');

figure,

imhist(x1);
xlabel('Intensities');
ylabel('Number of pixels');
legend('imhist()output');