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
Minf = linspace(0, 8, 5000);

nth = zeros(1, length(Minf));
nprop = zeros(1, length(Minf));

%% Run

for i = 1:length(Minf)
    [~,~,~,~,~,~,nth(i),nprop(i)] = ramjet(Tinf, Pinf, Minf(i), Mx, M2, Tb, F);
end

%% Plots

f = figure;
hold on;

plot(Minf, nth);
plot(Minf, nprop);
plot(Minf, nth .* nprop, 'k--');

ylim([0, 1.4]);

xlabel('M_{\infty} [K]')
ylabel('\eta [-]');

legend('\eta_{thermal}', '\eta_{prop}', '\eta_0');

grid;
improvePlot;

set(f, 'Position', [10 10 900 600]);