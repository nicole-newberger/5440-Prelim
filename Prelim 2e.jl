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
s = 100


 du[1] = ((alpha_x+beta_x*s)/(1+s+(u[3]/z_x)^n_zx))-u[1]              #dx/dt
 du[2] = ((alpha_y+beta_y*s)/(1+s+(u[1]/x_y)^n_xy))-delta_y*u[2]      #dy/dt
 du[3] = (1/(1+(u[1]/x_z)^n_xz+(u[2]/y_z)^n_yz))-delta_z*u[3]         #dz/dt
end
#for first part (Hopf bifurcation)
#u01 = [0.00096413, 0.58530639, 0.00033949]   #intial conditions cell 1
#u02 = [0.001205;0.731633;0.0004244]          #intial conditions cell 2
#u03 = [0.000723098;0.43898;0.00025462]       #intial conditions cell 3

#for second part (saddle bifurcation)
u01 = [0.1065, 0.2829, 0.0015]              #intial conditions cell 1
u02 = [0.133125;0.353625;0.001875]          #intial conditions cell 2
u03 = [0.079875;0.212175;0.001125]          #intial conditions cell 3
tspan = (0.0,50.0)                          #start and end time
prob1 = ODEProblem(equation,u01,tspan)      #problem for cell 1
prob2 = ODEProblem(equation,u02,tspan)      #problem for cell 2
prob3 = ODEProblem(equation,u03,tspan)      #problem for cell 3

sol1 = solve(prob1)                         #Solve the system for cell 1
sol2 = solve(prob2)                         #Solve the system for cell 2
sol3 = solve(prob3)                         #Solve the system for cell 3


#Plot the results; the vars=(0,3) argument specifies to plot Z (column 3 of sol)
#vs t
plt3 = plot(sol1,vars=(0,3), xaxis="t", yaxis = "Z")
plt3 = plot!(sol2,vars=(0,3))    #use plot!() to layer graphs
plt3 = plot!(sol3,vars=(0,3))
display(plt3)
