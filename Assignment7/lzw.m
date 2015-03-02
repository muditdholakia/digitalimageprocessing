clc;
clear all;
close all;
datain=input('enter the string in single quote with symbol $ as End of string =');%input data
lda=length(datain);%length of datainput
dictionary=input('enter the dictionary in single quote(symbol used in string are to be included)=');%input dictionary
ldi=length(dictionary);%length of dictionary
j=1;%used for generating code
n=0;%used for
%loop used for string array to cell array conversion
for i=1:ldi
dictnew(i)={dictionary(i)};
end

p=datain(1);%first symbol
s=p;%current symbol
k=1; %used for generating transmitting output code
i=1;%for loop
m=0;
while datain(i)~= '$'%end of symbol
c=datain(i+1);
if c~='$'
comb=strcat(s,c);%just for see combination
if strcmp(dictnew,strcat(s,c))==0
dictnew(j+ldi)={strcat(s,c)};
%lopp and check used for generating transmitting
%code array
check=ismember(dictnew,s);
for l=1:length(check)
if check(l)==1
tx_trans(k)=l;
k=k+1;
break;
end
end

s=c;
j=j+1;
i=i+1;
m=m+1;

else

s=strcat(s,c);
i=i+1;
end

else
%for sending last and eof tx_trans
check=ismember(dictnew,s);
for l=1:length(check)
if check(l)==1
tx_trans(k)=l;
k=k+1;
tx_trans(k)=0;
end
end
break;
end
end
display('new dictionary=')
display(dictnew);
display(tx_trans);

%decoding
dicgen=dictionary;
ldgen=length(dicgen);
ldtx=length(tx_trans);
index=length(dictionary);
string='';
%loop and below inst. used for cell array to char array
dicgen=cellstr(dictionary);
for i=1:ldi
dicgen(i)={dictionary(i)};
end
g=1;
entry=char(dictionary(tx_trans(1)));%first symbol
g=g+1;% next symbol
while tx_trans(g)~=0 %for EOF
s=entry;
entry=char(dicgen(tx_trans(g)));
string=strcat(string,s); %detected string
index=index+1; % next index
dicgen(index) = {strcat(s,entry(1))};%upgrade dictionary
g=g+1; % next index

end
string=strcat(string,entry)
disp(dicgen);
display('received original string=');
disp(string);