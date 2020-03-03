function [M,T_ratio,P_ratio,A_ratio] = isentropic_flow(gamma,data_value,data_type)
% Function to determine isentropic flow relations
% Inputs:   gamma (specific heat ratio) 
%           data_value (isentropic flow paramter)
%           data_type (isentropic flow parameter type)
% Outputs:  T_ratio (defined as local static temperature over the stagnation temperature)
%           P_ratio (defined as local static pressure over the stagnation pressure)
%           A_ratio (defined as local stream tube area over the reference stream tube area for sonic conditions) 
% Note: unlike the notes, T_ratio and P_ratio are defined as static over stagnation values

% Set default data type to Mach number
if ~exist('data_type','var')
    data_type = 'M';
end 

% Calculate Mach number given the isentropic flow paramter type
if data_type == 'M' 
    M = data_value;
elseif data_type == 'P_ratio'
    M = sqrt(((1/data_value)^((gamma - 1)/gamma) - 1)*(2/(gamma - 1)));
elseif data_type == 'T_ratio'
    M = sqrt(((1/data_value) - 1)*(2/(gamma - 1)));
end

T_ratio = 1/(1 + ((gamma - 1)*M^2)/2);
P_ratio = 1/((1 + ((gamma - 1)*M^2)/2)^((gamma)/(gamma - 1)));
A_ratio = (1/M)*((2/(gamma + 1))*(1 + ((gamma - 1)*M^2)/2))^((gamma + 1)/(2*(gamma - 1)));

end