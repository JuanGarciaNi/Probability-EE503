n = 100;

X=[];
Y=[];
Z=[];

for i=1:(2*n)
  A = random('norm', 0,1);
  B = random('norm', 0,1);
  C = random('norm', 0,1);
  D = random('poiss', 0.5);
  
  M = [-2 3; .8 2];
    
  NewX = A*2.3+1.2;
  X = [X; NewX];
  Y = [Y; cos(NewX)+B/3];
  Z = [Z; exp(NewX+C)];
end

Xtrain = X(1:n);
Ytrain = Y(1:n);
Ztrain = Z(1:n);
Y = Y((n+1):2*n);
Z = Z((n+1):2*n);
X = X((n+1):2*n);
NumSamples = n;

save('File2.mat', 'NumSamples', 'Xtrain', 'Ytrain', 'Ztrain', 'Y', 'Z')
save('FileTrue2.mat', 'X')
