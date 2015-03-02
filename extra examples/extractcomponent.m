I=imread('label3.jpg');

I=im2bw(I);

%Structuring element
B=strel('square',3);
A=I;
%Find a non-zero element's position.
p=find(A==1);
p=p(1);
Label=zeros([size(A,1) size(A,2)]);
N=0;

while(~isempty(p))
    N=N+1;%Label for each component
    p=p(1);
X=false([size(A,1) size(A,2)]);
X(p)=1;

Y=A&imdilate(X,B);
while(~isequal(X,Y))
    X=Y;
    Y=A&imdilate(X,B);
end

Pos=find(Y==1);

A(Pos)=0;
%Label the components
Label(Pos)=N;

p=find(A==1);

end
imtool(Label);









%Extracting the components
Im=zeros([size(A,1) size(A,2)]);
ele=find(Label==1);
Im(ele)=1;
figure,imshow(Im);title('Label:1');


%Extracting the characters 'I M A G E'
ele=find(Label==2|Label==3|Label==6|Label==7|Label==9);
Im1=zeros([size(A,1) size(A,2)]);
Im1(ele)=1;
figure,imshow(Im1);title('Specific components');



Total=sprintf('Total Number of Letters:%d',N);
display(Total);


%Differentiate each component with a specific color
RGBIm=zeros([size(Label,1) size(Label,2) 3]);
R=zeros([size(Label,1) size(Label,2)]);
G=zeros([size(Label,1) size(Label,2)]);
B=zeros([size(Label,1) size(Label,2)]);
U=64;
V=255;
W=128;
for i=1:N
    Pos=find(Label==i);
    R(Pos)=mod(i,2)*V;
    G(Pos)=mod(i,5)*U;
    B(Pos)=mod(i,3)*W;
   
   
 end
RGBIm(:,:,1)=R;
RGBIm(:,:,2)=G;
RGBIm(:,:,3)=B;
RGBIm=uint8(RGBIm);
figure,imshow(RGBIm);title('Labelled Components');


