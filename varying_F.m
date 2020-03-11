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
F = linspace(0, 50, 1000);

nth = zeros(1, length(F));
nprop = zeros(1, length(F));

%% Run

for i = 1:length(F)
    [~,~,~,~,~,~,nth(i),nprop(i)] = ramjet(T1, P1, M1, Mx, M2, Tb, F(i));
end

%% Plots

f = figure;
hold on;

plot(F, nth);
plot(F, nprop);
plot(F, nth .* nprop, 'k--');

ylim([0, 1]);

xlabel('F [N]')
ylabel('\eta [-]');

legend('\eta_{thermal}', '\eta_{prop}', '\eta_0');

grid;
improvePlot;

set(f, 'Position', [10 10 900 600]);