% Plot of nth and nprop for varying free stream pressure
% AERO96016 Adv. Prop. Coursework
% Created by Shreeyam Kacker 2020-03-04

%% Housekeeping
clc;
clear;
close all;

%% Setup

% Load default values
defaults;
Tinf = linspace(0, 1000, 1000);

nth = zeros(1, length(Tinf));
nprop = zeros(1, length(Tinf));

%% Run

for i = 1:length(Tinf)
    [~,~,~,~,~,~,nth(i),nprop(i)] = ramjet(Tinf(i), Pinf, Minf, Mx, M2, Tb, F);
end

%% Plots

f = figure;
hold on;

plot(Tinf, nth);
plot(Tinf, nprop);
plot(Tinf, nth .* nprop, 'k--');

ylim([0, 1.4]);

xlabel('T_{\infty} [K]')
ylabel('\eta [-]');

legend('\eta_{thermal}', '\eta_{prop}', '\eta_0');

grid;
improvePlot;

set(f, 'Position', [10 10 900 600]);