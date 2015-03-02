j=imread('lena.jpg');
[row col byt]=size(j) ;
imshow(j); % original image

T1=input('enter the Lowest threshold value:') ;
T2=input('enter the Highest threshold value:');
for x=1:1:row
    for y=1:1:col
        if j(x,y)>T1 && j(x,y)<T2
            j(x,y)=255;
        else
            j(x,y)=j(x,y);
        end
    end
end
imshow(uint8(j)) % gray level slicing with background