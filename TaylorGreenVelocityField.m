clear all
close all
clc

x = 0:0.1:2*pi;
y = 0:0.1:2*pi;
[X,Y] = meshgrid(x,y);

u = cos(X).*sin(Y);
v = -sin(X).*cos(Y);
V = u.^2 + v.^2;

figure(1)
contourf(X,Y,V,10)
axis square
xlabel('X','FontSize',12)
ylabel('Y','FontSize',12)
colorbar
title('Taylor-Green Vortex','u = cos(x)*sin(y), v = -sin(x)*cos(y)')

figure(2)
quiver(X(1:3:end,1:3:end),Y(1:3:end,1:3:end),u(1:3:end,1:3:end),v(1:3:end,1:3:end))
xlabel('X','FontSize',12)
ylabel('Y','FontSize',12)
axis tight
axis equal
title('Vector plot of Taylor-Green Vortex')
 
figure(3)
surf(X,Y,V)
xlabel('X','FontSize',12)
ylabel('Y','FontSize',12)
zlabel('V','FontSize',12)
title('Velocity Surface Plot of Taylor-Green Vortex')
 
% Find the numerical curl and angular velocity of the 2-D vector field
[curlz,cav] = curl(X,Y,u,v);
figure(4)
contourf(X,Y,curlz,10)
xlabel('X','FontSize',12)
ylabel('Y','FontSize',12)
axis square
colorbar
title('$\omega = \nabla \times \vec{V}$','Interpreter', 'latex','FontSize',16) 

% Divergence of velocity field
figure(5)
div = divergence(X,Y,u,v);
contourf(X,Y,div,10)
xlabel('X','FontSize',12)
ylabel('Y','FontSize',12)
axis tight
axis equal
colorbar
title('$\nabla \cdot \vec{V}$','Interpreter','latex','FontSize',16)

%Gradient of scalar field(pressure)
p = -(cos(2*X) + cos(2*Y));
[px,py] = gradient(p);
figure(6)
contourf(X,Y,p)
colorbar
hold on
quiver(X,Y,-px,-py,'r')
xlabel('X','FontSize',12)
ylabel('Y','FontSize',12)
title('Pressure(p) (contour) and $\nabla{p}$ (arrow)','FontSize',16,'Interpreter','latex')