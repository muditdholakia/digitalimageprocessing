l1=imread('lena.jpg');
sz=size(l1)

l3=uint8(zeros(sz(1)+2,sz(2)+2))

m=input('Insert mask dimension');
msk=zeros(m,m);
l2=uint8(zeros(sz(1)+m-1,sz(2)+m-1))
for i=1:m
    for j=1:m
        msk(i,j)=(1/(m*m));
    end
end
    
for i=1:sz(1)
    for j=1:sz(2)
        l2(i+1,j+1)=l1(i,j);
    end
end

for i=((m+1)/2):sz(1)
    for j=((m+1)/2):sz(1)
        for k=i-(m-1/2)
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