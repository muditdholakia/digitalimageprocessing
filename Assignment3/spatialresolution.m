I='lena.tif';
I=imread(I);
I=imresize(I,[512 512]);
num=512;
for i=1:4
a1 = i;
i1 = 1:a1:512;
I1 = I(i1,i1);

figure,imshow(I1);title(strcat(num2str(num),'*',num2str(num),'image'));
num=num/2;
end