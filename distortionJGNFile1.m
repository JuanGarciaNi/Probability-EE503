%This is a program that loads in the data of File1.mat
% The variables this loads is: 
%Numsamples = number of samples (100)
%Xtrain
%Ytrain
%Ztrain
%Y
%Z

clear
load('File1.mat');
%load('FileTrue1.mat')

n = NumSamples;

%This creates Xhat trivially by Xhat = (Y+Z)/2
Xhatmean = (Ytrain+Ztrain)/2;

%Let's  propose Xhat=a1*Y+a2*Z a linear estimator;
EX=sum(Xtrain)/n;
EY=sum(Ytrain)/n;
EZ=sum(Ztrain)/n;
EY2=sum(Ytrain.^2)/n;
EZ2=sum(Ztrain.^2)/n;
EYZ=sum(Ytrain.*Ztrain)/n;
EYX=sum(Ytrain.*Xtrain)/n;
EZX=sum(Ztrain.*Xtrain)/n;

%Let's get the optimal coefficients
den=(EY2-EY^2)*(EZ2-EZ^2)-(EYZ-EY*EZ)^2;
a1=((EYX-EY*EX)*(EZ2-EZ^2)-(EYZ-EY*EZ)*(EZX-EZ*EX))/den
a2=((EZX-EZ*EX)*(EY2-EY^2)-(EYZ-EY*EZ)*(EYX-EY*EX))/den

%This creates a pretend Xhat
XhatLinear=a1*(Ytrain-EY)+a2*(Ztrain-EZ)+EX;

%The corrrect plane equation usedin Generate1.m is 
XhatCorrect=2.65+1.5*(Ytrain+1.45);

%Using Xtrain as Xpretend
Xpretend = Xtrain;
%Xpretend = X


distmean = 0;
for i=1:n
    distmean = distmean + (Xhatmean(i)-Xpretend(i))^2;
end
distmean = distmean/n

distapprox = 0;
for i=1:n
    distapprox = distapprox + (XhatLinear(i)-Xpretend(i))^2;
end
distapprox = distapprox/n

distcorrect = 0;
for i=1:n
    distcorrect = distcorrect + (XhatCorrect(i)-Xpretend(i))^2;
end
distcorrect = distcorrect/n

[y,z] = meshgrid(-10:0.5:5,-20:20);
[v,w] = meshgrid(-10:0.5:5,-20:20);

x = a1*(y-EY) + a2*(z-EZ)+EX;
u = 2.65+1.5*(v+1.45);

figure
surf(y,z,x,'EdgeAlpha', 0.25)
colormap white		
hold on;
scatter3(Ytrain,Ztrain,Xtrain)
hold on;
surf(v,w,u,'EdgeAlpha', 0.25)
colormap white		


