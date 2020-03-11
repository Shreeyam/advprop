%% Housekeeping

clc;
clear;
close all;

%% Plots here

% In order

% Varying Tinf
varying_T1;
saveas(gcf, './plots/varying_Tinf.eps', 'epsc');
close all;
% Varying Pinf
varying_P1;
saveas(gcf, './plots/varying_Pinf.eps', 'epsc');
close all;
% Varying Minf
varying_M1;
saveas(gcf, './plots/varying_Minf.eps', 'epsc');
close all;
% Varying Mx
varying_Mx;
saveas(gcf, './plots/varying_Mx.eps', 'epsc');
close all;
% Varying M2
varying_M2;
saveas(gcf, './plots/varying_M2.eps', 'epsc');
close all;
% Varying Tb
varying_Tb;
saveas(gcf, './plots/varying_Tb.eps', 'epsc');
close all;
% Varying F
varying_F;
saveas(gcf, './plots/varying_F.eps', 'epsc');
close all;
