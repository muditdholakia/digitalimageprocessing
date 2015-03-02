a=imread('d1.jpg');
[r c d] = size(a);
red= a(:,:,1);
green = a(:,:,2);
blue = a(:,:,3);
plane = zeros(r,c);
R = cat(3,red,plane,plane);
G = cat(3,plane,green,plane);
B = cat(3,plane,plane,blue);
subplot(2,2,1)
imshow(a);
subplot(2,2,2)
imshow(R);
subplot(2,2,3)
imshow(G);
subplot(2,2,4)
imshow(B);