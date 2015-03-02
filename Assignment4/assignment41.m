x=input('PRESS::1.NEGATIVE.2.LOG TRANSFORMATION.3.GAMMA TRANSFORMATION:');
if x==1
    a=uigetfile('*.*','Select the Image');
    a=imread(a);
    [r,c]=size(a);
    for i=1:r
        for j=1:c
            new(i,j)=255-a(i,j);
        end
    end
        subplot(121);
        title('ORIGINAL IMAGE');
        imshow(a);
        subplot(122);
        title('NEGATIVE IMAGE');
        imshow(new);
elseif x==2
    a=imread(uigetfile('*.*','Select the Image'));
    a1=double(a);
    sz=size(a1);    
    new=ones(sz(1),sz(2));
    c1=10;
    for i=1:sz(1)
        for j=1:sz(2)
            p1 = 1+a1(i,j);
            new(i,j)= c1 * log(p1);
        end
    end
    imshow(mat2gray(new));
elseif x==3
        Y =0.6;
        Y1=0.4;
        Y2=0.3;
        c1=1;
        new=ones(sz(1),sz(2));
        new1=ones(sz(1),sz(2));
        new2=ones(sz(1),sz(2));
        a=imread(uigetfile('*.*','Select the Image'));
        
        a1=uint8(a);
        sz=size(a1);    
        a1=im2double(a);
        for i=1:sz(1)
                for j=1:sz(2)
                    new(i,j)= c1 .* a1(i,j)^Y;
                    new1(i,j)= c1 .* a1(i,j)^Y1;
                    new2(i,j)= c1 .* a1(i,j)^Y2;
                end
            end
        subplot(221);
        title('ORIGINAL IMAGE');
        imshow(a);
        subplot(222);
        title('Y=0.6');
        imshow(new);
        subplot(223);
        title('Y=0.4');
        imshow(new1);
        subplot(224);
        title('Y=0.3');
        imshow(new2);

end