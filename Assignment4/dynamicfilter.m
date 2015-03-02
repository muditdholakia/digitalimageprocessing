l1=imread('lena.jpg');
l2=imread('b.tif');
figure(1)
title('ORIGINAL IMAGE');
imshow(l2);

h=fspecial('average',3);
f1=imfilter(l2,h)

figure(2)
title('AVERAGE MASK FILTER');imshow(f1)
h=fspecial('gaussian');
f2=imfilter(l1,h)
imshow(f2)





