%Code to solve for the steady state values for problem 2e
syms x y z

alpha_x = 3.9*10^-2;
alpha_y = 4.3*10^-3;
beta_x = 6.1;
beta_y = 5.7;
delta_y = 1.05;
delta_z = 1.04;
z_x = 1.3*10^-5;
y_z = 11*10^-3;
x_z = 12*10^-2;
x_y = 7.9*10^-4;
n_zx = 2.32; 
n_xy = 2; 
n_xz = 2; 
n_yz = 2; 
s = 0.3;
%s=1000;

eqn1=((alpha_x+beta_x*s)/(1+s+(z/z_x)^n_zx))-x==0;
eqn2=((alpha_y+beta_y*s)/(1+s+(x/x_y)^n_xy))-delta_y*y==0;     
eqn3=(1/(1+(x/x_z)^n_xz+(y/y_z)^n_yz))-delta_z*z==0;    

sol = vpasolve([eqn1, eqn2, eqn3],[x,y,z]);

disp(sol.x)
