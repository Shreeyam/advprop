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
T1 = linspace(0, 1000, 1000);

nth = zeros(1, length(T1));
nprop = zeros(1, length(T1));

%% Run

for i = 1:length(T1)
    [~,~,~,~,~,~,nth(i),nprop(i)] = ramjet(T1(i), P1, M1, Mx, M2, Tb, F);
end

%% Plots

f = figure;
hold on;

plot(T1, nth);
plot(T1, nprop);
plot(T1, nth .* nprop, 'k--');

ylim([0, 1.4]);

xlabel('T_{\infty} [K]')
ylabel('\eta [-]');

legend('\eta_{thermal}', '\eta_{prop}', '\eta_0');

grid;
improvePlot;

set(f, 'Position', [10 10 900 600]);