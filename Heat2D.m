clear all
close all
clc

% plate size, mm
width = 10.;
height = 10.;
% intervals in x-, y- directions, mm
dx = 0.1;
dy = 0.1;
% Thermal diffusivity of steel, mm^2/s
D = 4.;

Tcool = 300;
Thot = 700;

nx = int32(width/dx);
ny = int32(height/dy);

dx2 = dx*dx;
dy2 = dy*dy;
dt = dx2*dy2/(2*D*(dx2+dy2));

u0 = Tcool*ones(nx,ny);
u = u0(:,:);

% Initial condition - circle of radius r centered at (cx,cy) (mm)
r = 2;
cx = 5;
cy = 5;
r2 = r^2;

for i = 1:nx
    for j = 1:ny
        p2 = (i*dx-cx)^2 + (j*dy-cy)^2;
        if p2 < r2
            u0(i,j) = Thot;
        end
    end
end

%imshow(u0(:,:),[Tcool Thot],'Interpolation',"bilinear")
%colormap('hot')

% Number of time steps
nsteps = 101;
% Output figure at these timesteps
mfig = [1, 10, 50, 100];
tiledlayout(2,2);
fignum = 0;

for m = 1:nsteps
    u(2:end-1,2:end-1) = u0(2:end-1,2:end-1) + D*dt*(...
        (u0(3:end,2:end-1)-2.*u0(2:end-1,2:end-1)+u0(1:end-2,2:end-1))/dx2 ...
        + (u0(2:end-1,3:end) -2.*u0(2:end-1,2:end-1) + u0(2:end-1,1:end-2))/dy2);
    u0 = u(:,:);
    if ismember(m,mfig)
        fignum = fignum + 1;
        %disp([m, fignum])
        %subplot(2,2,fignum)
        nexttile
        imshow(u(:,:),[Tcool Thot])
        colormap(hot)
        axis('off')
        title(strcat({num2str(m*dt*1000)},{' ms'}))
    end
end

cb = colorbar;
cb.Layout.Tile = 'east';
cb.Label.String = 'Temperature (K)';
cb.FontSize = 12;



