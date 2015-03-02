I=imread('lena.jpg');
if ~islogical(I)
  I = im2uint8(I);
end

% calculate histogram counts
p = imhist(I(:));

% remove zero entries in p 
p(p==0) = [];

% normalize p so that sum(p) is one.
p = p ./ numel(I);

E = -sum(p.*log2(p));
display('Entropy:');
display(E);