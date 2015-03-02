h1=imread('tvr.tif');
h=im2double(h1);
sz=size(h);
sum=0;
v1=0;
v2=0;
for i=1:sz(1)
    for j=1:sz(2)
     sum=sum+h(i,j);   
    end
end
mn=sum/(sz(1)*sz(2));
disp('Mean is::');
disp(mn);
for i=1:sz(1)
    for j=1:sz(2)
     v1=h(i,j)-mn;
     v2=v2+v1;
    end
end
varn=v2/((sz(1)*sz(2))-1);
disp('Variance is::');
disp(varn);
disp('Standard Deviation is::');
disp(sqrt(double(varn)));