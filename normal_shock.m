function [T_ratio,P_ratio,rho_ratio,downstream_M] = normal_shock(gamma,upstream_M)
% Function to determine normal shock relations
% Inputs:   gamma (specific heat ratio) 
%           upstream_M (Mach number upstream of the shock)
% Outputs:  T_ratio (defined as static temperature downstream of the shock over the static temperature upstream of the shock)
%           P_ratio (defined as static temperature downstream of the shock over the static temperature upstream of the shock)
%           rho_ratio (defined as density ratio of the fluid downstream of the shock over the density upstream of the shock)
%           downstream_M (Mach number downstream of the shock)

T_ratio = ((2*gamma*upstream_M^2 - (gamma - 1))*(2 + (gamma - 1)*upstream_M^2)/((gamma + 1)^2*upstream_M^2));
P_ratio = (2*gamma*upstream_M^2 - (gamma - 1))/(gamma + 1);
rho_ratio = (gamma + 1)*upstream_M^2/((gamma - 1)*upstream_M^2 + 2);
downstream_M = sqrt(((gamma - 1)*upstream_M^2 + 2)/(2*gamma*upstream_M^2 - (gamma - 1)));

end
