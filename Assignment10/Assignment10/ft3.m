clear all;
clc;
close all;

f=zeros(30,30); 
%With a white rectangle in it. 
f(5:24,13:17)=1; 
subplot(2,3,1);imshow(f,'InitialMagnification', 'fit');title('Original image')
%Calculate the DFT. 
F=fft2(f); 
%There are real and imaginary parts to F. 
%Use the abs function to compute the magnitude 
%of the combined components. 
F2=abs(F); 
subplot(2,3,2);imshow(F2,[], 'InitialMagnification','fit');title('abs()')
%To create a finer sampling of the Fourier transform, 
%you can add zero padding to f when computing its DFT 
%Also note that we use a power of 2, 2^256 
%This isbecause the FFT -Fast Fourier Transform - 
%is fastest when the image size has many factors. 
F=fft2(f, 256, 256); 
F2=abs(F); 
subplot(2,3,3);imshow(F2, []);title('Padded with pixels')
%The zero-frequency coefficient is displayed in the 
%upper left hand corner. To display it in the center, 
%you can use the function fftshift. 
F2=fftshift(F); 
F2=abs(F2); 
subplot(2,3,4);imshow(F2,[]);title('ffshift')
%In Fourier transforms, high peaks are so high they %hide details. Reduce contrast with the log function. 
F2=log(1+F2);
subplot(2,3,5);imshow(F2,[]);title('log transformation')