% Plot of nth and nprop for varying free stream mach number
% AERO96016 Adv. Prop. Coursework
% Created by Shreeyam Kacker 2020-03-04

%% Housekeeping
clc;
clear;
close all;

%% Setup

% Load default values
defaults;
Tb = linspace(0, 2000, 1000);

nth = zeros(1, length(Tb));
nprop = zeros(1, length(Tb));

%% Run

for i = 1:length(Tb)
    [~,~,~,~,~,~,nth(i),nprop(i)] = ramjet(T1, P1, M1, Mx, M2, Tb(i), F);
end

%% Plots

f = figure;
hold on;

plot(Tb, nth);
plot(Tb, nprop);
plot(Tb, nth .* nprop, 'k--');

ylim([0, 1]);

xlabel('T_b [K]')
ylabel('\eta [-]');

legend('\eta_{thermal}', '\eta_{prop}', '\eta_0');

grid;
improvePlot;

set(f, 'Position', [10 10 900 600]);