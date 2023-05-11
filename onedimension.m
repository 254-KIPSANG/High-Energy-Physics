% Clearing variables in memory and MATLAB command screen
clear all;
clc;

% Number of grid points
N = 200;

% Total number of time steps
time_tot = 500;

% Courant stability factor
S = 1 / sqrt(2);

% Parameters of the medium
epsilon0 = 8.854e-12;  % Vacuum permittivity
mu0 = 4 * pi * 1e-7;  % Vacuum permeability
c = 1 / sqrt(epsilon0 * mu0);  % Speed of light

% Spatial grid step length
delta = 1e-3;  % 1 mm

% Temporal grid step obtained using Courant condition
deltat = S * delta / c;

% Initialization of field matrices
Ez = zeros(1, N);
Hy = zeros(1, N-1);

% Source parameters
source_position = round(N / 4);
frequency = 1e9;  % 1 GHz

% Update loop
for n = 1:time_tot
    % Update H field
    Hy = Hy + (Ez(2:N) - Ez(1:N-1)) * (deltat / delta / mu0);
    
    % Source update
    t = n * deltat;
    Ez(source_position) = sin(2 * pi * frequency * t);
    
    % Update E field
    Ez(2:N-1) = Ez(2:N-1) + (Hy(2:N-1) - Hy(1:N-2)) * (deltat / delta / epsilon0);
    
    % Plotting
    plot(delta * (1:N), Ez);
    axis([0 delta * N -1 1]);
    title(['Sinusoidal Wave Propagation at t = ' num2str(t)]);
    xlabel('Position (m)');
    ylabel('Ez');
    drawnow;
end
