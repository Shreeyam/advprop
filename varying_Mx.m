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
Mx = linspace(1, 2, 5000);

nth = zeros(1, length(Mx));
nprop = zeros(1, length(Mx));

%% Run

for i = 1:length(Mx)
    [~,~,~,~,~,~,nth(i),nprop(i)] = ramjet(T1, P1, M1, Mx(i), M2, Tb, F);
end

%% Plots

f = figure;
hold on;

plot(Mx, nth);
plot(Mx, nprop);
plot(Mx, nth .* nprop, 'k--');

ylim([0, 1]);

xlabel('M_{x} [K]')
ylabel('\eta [-]');

legend('\eta_{thermal}', '\eta_{prop}', '\eta_0');

grid;
improvePlot;

set(f, 'Position', [10 10 900 600]);