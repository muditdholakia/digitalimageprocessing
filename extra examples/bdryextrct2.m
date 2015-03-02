A=imread('binaryimg.png');


s=strel('disk',2,0);


F=imerode(A,s);





figure,


subplot(2,1,1);


imshow(A);title('Binary Image');


subplot(2,1,2);


imshow(A-F);title('Boundary extracted Image');