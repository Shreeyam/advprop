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
M1 = linspace(1, 8, 5000);

nth = zeros(1, length(M1));
nprop = zeros(1, length(M1));

%% Run

for i = 1:length(M1)
    [~,~,~,~,~,~,nth(i),nprop(i)] = ramjet(T1, P1, M1(i), Mx, M2, Tb, F);
end

%% Plots

f = figure;
hold on;

plot(M1, nth);
plot(M1, nprop);
plot(M1, nth .* nprop, 'k--');

ylim([0, 1.4]);

xlabel('M_{\infty} [-]')
ylabel('\eta [-]');

legend('\eta_{thermal}', '\eta_{prop}', '\eta_0');

grid;
improvePlot;

set(f, 'Position', [10 10 900 600]);