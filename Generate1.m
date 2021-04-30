n = 100;

X=[];
Y=[];
Z=[];

for i=1:(2*n)
  A = random('norm', 0,1);
  B = random('norm', 0,1);
  C = random('norm', 0,1);
  
  M = [-2 3; .8 2];
    
  V = M*[A;B];
  X = [X; V(1)+2.65];
  Y = [Y; V(2)-1.45];
  Z = [Z; C*8+1.9];
end

Xtrain = X(1:n);
Ytrain = Y(1:n);
Ztrain = Z(1:n);
Y = Y((n+1):2*n);
Z = Z((n+1):2*n);
X = X((n+1):2*n);
NumSamples = n;

save('File1.mat', 'NumSamples', 'Xtrain', 'Ytrain', 'Ztrain', 'Y', 'Z')
save('FileTrue1.mat', 'X')
