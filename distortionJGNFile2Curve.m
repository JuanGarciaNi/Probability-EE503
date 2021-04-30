%This is a program that loads in the data of File1.mat
% The variables this loads is: 
%Numsamples = number of samples (100)
%Xtrain
%Ytrain
%Ztrain
%Y
%Z
clear
load('File2.mat');
%load('FileTrue1.mat')

n = NumSamples;

%The corrrect plane equation usedin Generate1.m is 
XhatY=real(acos(Ytrain));
XhatZ=real(log(Ztrain));

%Using Xtrain as Xpretend
Xpretend = Xtrain;
%Xpretend = X

distXYcorr = 0;
for i=1:n
    distXYcorr = distXYcorr + (XhatY(i)-Xpretend(i))^2;
end
distXYcorr = distXYcorr/n

distXZcorr = 0;
for i=1:n
    distXZcorr = distXZcorr + (XhatZ(i)-Xpretend(i))^2;
end
distXZcorr = distXZcorr/n

%A polynomial approximation
EX=sum(Xtrain)/n;
EY2=sum(Ytrain.^2)/n;
EYX=sum(Ytrain.*Xtrain)/n;
ElnZ=sum(log(Ztrain))/n;
Eln2Z=sum(log(Ztrain).^2)/n;
EXlnZ=sum(Xtrain.*log(Ztrain))/n;

%Let's get the optimal coefficients
ax=EYX/EY2;
XhatYline=ax*Ytrain+EX;
den=Eln2Z-ElnZ^2;
ay=((EX*Eln2Z)-(EXlnZ*ElnZ))/den
by=((EXlnZ)-(EX*ElnZ))/den
XhatZline=ay+by*log(Ztrain);

distXYaprox = 0;
for i=1:n
    distXYaprox = distXYaprox + (XhatYline(i)-Xpretend(i))^2;
end
distXYaprox = distXYaprox/n

distXZaprox = 0;
for i=1:n
    distXZaprox = distXZaprox + (XhatZline(i)-Xpretend(i))^2;
end
distXZaprox = distXZaprox/n


x1=-2.5*pi:pi/200:2.5*pi;
y=cos(x1);
y1=-pi/2:pi/200:pi/2;
xlin=ax*y1+EX;

z1=0.01:0.1:2200;
z=exp(x1);
xpoli=ay+by*log(z1);

figure
scatter(Ytrain,Xtrain)
hold on
plot (y,x1)
hold on
plot (y1,xlin)

figure
scatter(Ztrain,Xtrain)
hold on
plot (z,x1)
hold on
plot (z1,xpoli)
    0.2319

t=-5:0.1:10;
tl=0:10:10000;
yt = cos(t);
zt = exp(t);
xt = t;

figure
scatter3(Ytrain,Ztrain,Xtrain)
hold on;
plot3(yt,zt,xt)
hold on;
plot3(cos(ay+by*log(tl)),tl,ay+by*log(tl))