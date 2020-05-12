using DifferentialEquations
using Plots
gr(size=(500,500), show = true)  #use the gr backend for plotting

#Function for equation 1 from the paper
#u[1] = x; u[2] = y; u[3] = z
function equation(du,u,p,t)
alpha_x = 3.9*10^-2
alpha_y = 4.3*10^-3
beta_x = 6.1
beta_y = 5.7
delta_y = 1.05
delta_z = 1.04
z_x = 1.3*10^-5
y_z = 11*10^-3
x_z = 12*10^-2
x_y = 7.9*10^-4
n_zx = 2.32
n_xy = 2
n_xz = 2
n_yz = 2
s = 100000

 du[1] = ((alpha_x+beta_x*s)/(1+s+(u[3]/z_x)^n_zx))-u[1]              #dx/dt
 du[2] = ((alpha_y+beta_y*s)/(1+s+(u[1]/x_y)^n_xy))-delta_y*u[2]      #dy/dt
 du[3] = (1/(1+(u[1]/x_z)^n_xz+(u[2]/y_z)^n_yz))-delta_z*u[3]         #dz/dt
end

u0 = [0.0, 0.0, 0.0]                      #intial conditions
tspan = (0.0,50.0)                     #start and end time
prob = ODEProblem(equation,u0,tspan)     #Create an ODE problem
sol = solve(prob)                       #Solve the system

#Plot the results; the vars=(0,1) argument specifies to plot X (column 1 of sol)
#vs t (column 0 of sol)
#plt1 = plot(sol,vars=(0,1), xaxis="t", yaxis = "X" )
#display(plt1)

#Plot the results; the vars=(0,2) argument specifies to plot Y (column 2 of sol)
#vs t
#plt2 = plot(sol,vars=(0,2), xaxis="t", yaxis = "Y")
#display(plt2)

#Plot the results; the vars=(0,3) argument specifies to plot Z (column 3 of sol)
#vs t
plt3 = plot(sol,vars=(0,3), xaxis="t", yaxis = "Z")
display(plt3)

#Plot the results; the vars=(1,2,3) argument specifies to plot X vs Y vs Z
#plt4 = plot(sol,vars=(1,2,3), xaxis="X", yaxis="Y", zaxis="Z")
#display(plt4)
