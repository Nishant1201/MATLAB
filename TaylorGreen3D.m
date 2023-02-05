clear all
close all
clc

x = 0.:(2*pi/255):2*pi;
y = x'; %0.:(2*pi/255):2*pi;
%z = 0.:(2*pi/255):2*pi;

u = sin(x).*cos(y);
v = -cos(x).*sin(y);

dz = 2.*pi/255;
z = 0.0;
U = zeros(256,256,256);
V = zeros(256,256,256);
W = zeros(256,256,256);

for k = 1:256
    U(:,:,k) = u.*cos(z);
    V(:,:,k) = v.*cos(z);
    z = z+dz;
end
Vel = sqrt(U.^2 + V.^2+W.^2);

figure(1)
[X,Y,Z] = meshgrid(x);
isosurface(X,Y,Z,Vel)

[curlx,curly,curlz,cav] = curl(X,Y,Z,U,V,W);
figure(2)
isosurface(X,Y,Z,curlx)
figure(3)
isosurface(X,Y,Z,curly)
figure(4)
isosurface(X,Y,Z,curlz)
camlight
lighting gouraud