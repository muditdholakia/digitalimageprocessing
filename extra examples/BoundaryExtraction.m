
A=imread('banana.jpg'); 

C=rgb2gray(A);


C(C<225)=0;


s=strel('disk',4,0);%Structuring element


D=~im2bw(C);%binary Image


F=imerode(D,s);%Erode the image by structuring element





figure,imshow(A);title('Original Image');


figure,imshow(D);title('Binary Image');

%Difference between binary image and Eroded image


figure,imshow(D-F);title('Boundary extracted Image');