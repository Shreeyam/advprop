% Advanced propulsion coursework AERO96016
% Ramjet generator
% Written by Arhant Sethia and Shreeyam Kacker 03/03/2020

% INPUTS:
% Free stream temperature
% Free stream pressure
% Normal shock strength
% Burner entry Mach number
% Burner Temperature
% Required thrust

% OUTPUTS:
% Inlet area
% Inlet throat area
% Burner entry area
% Nozzle throat area
% Exhaust area
% Thermodynamic efficiency
% Propulsive efficiency

function [A1, AC1, A2, Ab, AC2, A4, eta_th, eta_prop] = ramjet(T1, P1, M1, Mx, M2, Tb, F)

gamma = 1.4;
R = 287;

U1 = M1*sqrt(gamma*R*T1); % Speed of incoming air [m/s]

% Diffuser (1)
[~,T1_T01,P1_P01,A1_AC1] = isentropic_flow(gamma,M1); % Isentropic flow tables at Minf 
T01_T1 = 1/T1_T01; P01_P1 = 1/P1_P01; AC1_A1 = 1/A1_AC1; % C1 is the inlet throat 

% Shock (x and y)
[Ty_Tx,Py_Px,rhoy_rhox,My] = normal_shock(gamma,Mx); % Normal shock tables at Mx
[~,Tx_T0x,Px_P0x,As_AC1] = isentropic_flow(gamma,Mx); % Isentropic flow tables at Mx (note T0x = T01 and Ax = Ay = As)
T0x_Tx = 1/Tx_T0x; P0x_Px = 1/Px_P0x; AC1_As = 1/As_AC1;
[~,Ty_T0y,Py_P0y,As_Aystar] = isentropic_flow(gamma,My); % Isentropic flow tables at Mx (Aystar is the area required to choke the flow after the shock)
T0y_Ty = 1/Ty_T0y; P0y_Py = 1/Py_P0y; Aystar_As = 1/As_Aystar;

% Burner entry (2)
[~,T2_T02,P2_P02,A2_Aystar] = isentropic_flow(gamma,M2); % Isentropic flow tables at M2
T02_T2 = 1/T2_T02; P02_P2 = 1/P2_P02; Aystar_A2 = 1/A2_Aystar;
A2_A1 = A2_Aystar*Aystar_As*As_AC1*AC1_A1; % Area ratio - beginning of burner to inlet 
T2 = T1*T2_T02*T0y_Ty*Py_Px*(1/rhoy_rhox)*Tx_T0x*T01_T1; % Temperature before burner [K]

% Burner exit (b)
Mb = 0.5*sqrt(T2/Tb)*(M2 + 1/(gamma*M2)) - 0.5*sqrt((T2/Tb)*(M2 + 1/(gamma*M2))^2 - 4/gamma); % Assume that the weak solution is obtained at the burner outlet 
if Mb > 1 || Mb < 0
    disp('Error: choked flow');
elseif ((T2/Tb)*(M2 + 1/(gamma*M2))^2 - 4/gamma) < 0
    disp('Error: nonreal Mach number');
end 
Ab_A2 = (gamma*M2^2 + 1)/(gamma*Mb^2 + 1); % Area ratio - end of burner to beginning of burner 
Ab_A1 = Ab_A2*A2_A1; % Area ratio - end of burner to inlet

[~,Tb_T0b,Pb_P0b,Ab_AC2] = isentropic_flow(gamma,Mb); % Isentropic flow tables at Mb 
T0b_Tb = 1/Tb_T0b; P0b_Pb = 1/Pb_P0b; AC2_Ab = 1/Ab_AC2;
AC2_A1 = AC2_Ab*Ab_A1; % C2 is the nozzle throat

% Exhaust (4)
P04_P4 = P0b_Pb*P2_P02*P0y_Py*Py_Px*Px_P0x*P01_P1;
P4_P04 = 1/P04_P4;
[M4,T4_T04,~,A4_AC2] = isentropic_flow(gamma,P4_P04,'P_ratio'); % Reverse isentropic flow table to find M4 
T04_T4 = 1/T4_T04; AC2_A4 = 1/A4_AC2;  
A4_A1 = A4_AC2*AC2_A1; % Area ratio - engine exhaust to inlet 
T4 = Tb*T0b_Tb*T4_T04; % Nozzle exit temperature [K]
U4 = M4*sqrt(gamma*R*T4); % Nozzle exit speed [m/s]

% Compute actual areas [m^2] given thrust 
A1 = F/(P1*gamma*M1^2*((M4/M1)^2*A4_A1 - 1));
AC1 = A1*AC1_A1;
A2 = A1*A2_A1;
Ab = A1*Ab_A1;
AC2 = A1*AC2_A1;
A4 = A1*A4_A1;

% Thermodynamic efficiency
eta_th = 1 - (T4 - T1)/(Tb - T2);

% Propulsive efficiency 
eta_prop = (F/(P1*A1))*(2*R*T1/(U4^2 - U1^2));
 
% % Display outputs
% disp(['Inlet area [m^2]: ' num2str(A1)]);
% disp(['Inlet  throat area [m^2]: ' num2str(AC1)]);
% disp(['Burner entry area [m^2]: ' num2str(A2)]);
% disp(['Burner exit area [m^2]: ' num2str(Ab)]);
% disp(['Nozzle throat area [m^2]: ' num2str(AC2)]);
% disp(['Exhaust area [m^2]: ' num2str(A4)]);
% disp(['Thermodynamic efficiency: ' num2str(eta_th*100) '%']);
% disp(['Propulsive efficiency: ' num2str(eta_prop*100) '%']);

end


