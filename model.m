% Define constants
k = 1.380649e-23; % Boltzmann constant (J/K)
T = 300; % Temperature (K)
e = 1.602176634e-19; % Electron charge (C)
h = 6.62607015e-34; % Planck constant (J s)
m = 9.10938356e-31; % Electron mass (kg)
Ef = 0.3; % Fermi energy (eV)

% Define energy range
E = linspace(-0.5,0.5,1001); % Energy range in eV

% Calculate Fermi-Dirac distribution
F = 1./(1+exp((E-Ef)/(k*T/e)));

% Plot Fermi-Dirac distribution
figure(1);
plot(E,F,'LineWidth',2);
title('Fermi-Dirac Distribution');
xlabel('Energy (eV)');
ylabel('Occupation Probability');
ylim([0 1]);
grid on;

% Define band parameters
Ec = 0.4; % Conduction band energy (eV)
Ev = -0.1; % Valence band energy (eV)
Eg = Ec - Ev; % Band gap energy (eV)

% Calculate density of states
Nc = 2*((2*pi*m*k*T)/(h^2))^(3/2)*exp(-(Ec-Ef)/(k*T)); % Effective density of states in conduction band
Nv = 2*((2*pi*m*k*T)/(h^2))^(3/2)*exp(-(Ef-Ev)/(k*T)); % Effective density of states in valence band

% Calculate carrier concentrations
n = Nc*exp((Ef-Ec)/(k*T)); % Electron concentration
p = Nv*exp((Ev-Ef)/(k*T)); % Hole concentration

% Plot energy band diagram
figure(2);
plot([0 Eg], [Ec Ec], 'r-', 'LineWidth', 2); % Conduction band
hold on;
plot([0 Eg], [Ev Ev], 'b-', 'LineWidth', 2); % Valence band
plot([0 Eg], [Ef Ef], 'k--', 'LineWidth', 1); % Fermi level
hold off;
title('Energy Band Diagram');
xlabel('Energy (eV)');
ylabel('Energy Level (eV)');
ylim([Ev-0.1 Ec+0.1]);
grid on;
legend('Conduction Band', 'Valence Band', 'Fermi Level');
