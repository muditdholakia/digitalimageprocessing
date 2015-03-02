clc;
for i=1:6 %suppose there are 10 image
file_name=dir(strcat('D:\MAT-DIP-LAB-TVR\Assignment3\*.jpg')); % the path tht u hv imges
im=imread(file_name(i).name);
subplot(2,3,i)
imshow(im);
imwrite(im,strcat('D:\MAT-DIP-LAB-TVR\Assignment3\Emptybox\',file_name(i).name))
end