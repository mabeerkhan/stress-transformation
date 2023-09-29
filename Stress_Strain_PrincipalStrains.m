clc,clearvars
fprintf("Muhammad Abeer Khan ME-19221\n")
fprintf("Muhammad Asher      ME-19304")
%Stresses converted to strains then to principal strains
E=29e8
v=0.26
sigx_x=90;
sigy_y=54;
sigz_z=-36;
taux_y=27;
tauy_z=-15;
taux_z=-36;

ex_x=(1/E)*(sigx_x-v*(sigy_y+sigz_z))
ey_y=(1/E)*(sigy_y-v*(sigx_x+sigz_z))
ez_z=(1/E)*(sigz_z-v*(sigy_y+sigx_x))

gx_y=2*(1+v)*taux_y/E
gy_z=2*(1+v)*tauy_z/E
gx_z=2*(1+v)*taux_z/E

J_1=ex_x+ey_y+ez_z;
J_2=ex_x*ey_y+ey_y*ez_z+ez_z*ex_x-(1/4)*(gx_y^2+gy_z^2+gx_z^2);
J_3=ex_x*ey_y*ez_z+(1/4)*(-ex_x*gy_z^2-ey_y*gx_z^2-ez_z*gx_y^2+gx_y*gy_z*gx_z);

p=[1 -J_1 J_2 -J_3];
r=roots(p);

e_1=r(1,:)
e_2=r(2,:)
e_3=r(3,:)

% Mohr circle
% the center and radius of the Mohr's circle
center = (e_1 + e_2) / 2;
radius = abs(e_1 - e_2) / 2;
theta = linspace(0, 2*pi, 100);
 
% coordinates of the Mohr's circle
x = center + radius * cos(theta);
y = radius * sin(theta);

figure;
plot(x, y, 'b', 'LineWidth', 2);
hold on;
 
% principal strains
scatter(e_1, 0, 'r', 'filled');
scatter(e_2, 0, 'g', 'filled');
scatter(e_3, 0, 'b', 'filled');

xlabel('Normal Strain');
ylabel('Shear Strain');
title('Mohr''s Circle by Principal Strains');
grid on;
axis equal;
legend('Mohr''s Circle', 'Principal Strain 1', 'Principal Strain 2', 'Principal Strain 3');
 

% Mark the axis with dashed lines
plot([center, center], [-radius, radius], 'k--'); % Vertical dashed line
plot([e_1, e_2], [0, 0], 'k--'); % Horizontal dashed lines