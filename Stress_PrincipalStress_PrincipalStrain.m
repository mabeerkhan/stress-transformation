clc,clearvars
fprintf("Muhammad Abeer Khan ME-19221\n")
fprintf("Muhammad Asher      ME-19304")
%stress converted to principal stresses then to principal strains
E=29e8 
v=0.26
sigx_x=90;
sigy_y=54;
sigz_z=-36;
taux_y=27;
tauy_z=-15;
taux_z=-36;

i_1=sigx_x+sigy_y+sigz_z;
i_2=sigx_x*sigy_y+sigy_y*sigz_z+sigz_z*sigx_x-taux_y^2-tauy_z^2-taux_z^2;
i_3=sigx_x*sigy_y*sigz_z-sigx_x*tauy_z^2-sigy_y*taux_z^2-sigz_z*taux_y^2+2*taux_y*tauy_z*taux_z;

p=[1 -i_1 i_2 -i_3];
r=roots(p);
%tau_max=(max(r)-min(r))/2

e_1=(1/E)*(r(1,:)-v*(r(2,:)+r(3,:)))
e_2=(1/E)*(r(2,:)-v*(r(1,:)+r(3,:)))
e_3=(1/E)*(r(3,:)-v*(r(2,:)+r(1,:)))
 
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
title('Mohr''s Circle by Principal Stresses');
grid on;
axis equal;
legend('Mohr''s Circle', 'Principal Strain 1', 'Principal Strain 2', 'Principal Strain 3');
 
% Mark the axis with dashed lines
plot([center, center], [-radius, radius], 'k--'); % Vertical dashed line
plot([e_1, e_2], [0, 0], 'k--'); % Horizontal dashed lines







