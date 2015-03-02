l1=imread('b.tif');
sz=size(l1)
l2=uint8(zeros(sz(1)+2,sz(2)+2))
l3=uint8(zeros(sz(1)+2,sz(2)+2))
for i=1:sz(1)
    for j=1:sz(2)
        l2(i+1,j+1)=l1(i,j);
    end
end

msk=[1/9 1/9 1/9;1/9 1/9 1/9;1/9 1/9 1/9]
for i=2:sz(1)
    for j=2:sz(1)
    x1=l2(i,j)*msk(2,2);
    x2=l2(i+1,j+1)*msk(3,3);
    x3=l2(i-1,j-1)*msk(1,1);
    x4=l2(i,j-1)*msk(2,1);
    x5=l2(i+1,j-1)*msk(3,1);
    x6=l2(i-1,j)*msk(1,2);
    x7=l2(i-1,j+1)*msk(1,3);
    x8=l2(i+1,j)*msk(3,2);
    x9=l2(i,j+1)*msk(2,3);
    l3(i,j)=x1+x2+x3+x4+x5+x6+x7+x8+x9;
    end
end
figure(1)
title('ORIGINAL IMAGE')
imshow(l1);    
    
figure(2)
title('FILTERED IMAGE')
imshow(l3);
    