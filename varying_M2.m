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
M2 = linspace(0, 0.3, 1000);

nth = zeros(1, length(M2));
nprop = zeros(1, length(M2));

%% Run

for i = 1:length(M2)
    [~,~,~,~,~,~,nth(i),nprop(i)] = ramjet(T1, P1, M1, Mx, M2(i), Tb, F);
end

%% Plots

f = figure;
hold on;

plot(M2, nth);
plot(M2, nprop);
plot(M2, nth .* nprop, 'k--');

ylim([0, 1]);

xlabel('M_{2} [-]')
ylabel('\eta [-]');

legend('\eta_{thermal}', '\eta_{prop}', '\eta_0');

grid;
improvePlot;

set(f, 'Position', [10 10 900 600]);