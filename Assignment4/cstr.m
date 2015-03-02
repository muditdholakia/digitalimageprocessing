clear all
close all
clc
y=imread('rice.tif');

imshow(y);
[m n]=size(y);
%%%%%%%%%%Contrast Stretching%%%%%%%%%%%
a=input('Enter the value of input graylevel r1 for contrast stretching:');
b=input('Enter the value of input graylevel r2 for contrast stretching:');
for i=1:m
    for j=1:n
        if y(i,j)<=a
            zz(i,j)=0.5*y(i,j);
        else if y(i,j)<=b
                zz(i,j)=2*(y(i,j)-a)+0.5*a;
            else 
                zz(i,j)=0.5*(y(i,j)-b)+0.5*a+2*(b-a);
            end
        end
    end
end
   figure
   imshow(zz)
   title('contrast stretched image')