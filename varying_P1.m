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
P1 = linspace(0, 100);

nth = zeros(1, length(P1));
nprop = zeros(1, length(P1));

%% Run

for i = 1:length(P1)
    [~,~,~,~,~,~,nth(i),nprop(i)] = ramjet(T1, P1(i), M1, Mx, M2, Tb, F);
end

%% Plots

f = figure;
hold on;

plot(P1, nth);
plot(P1, nprop);
plot(P1, nth .* nprop, 'k--');

ylim([0, 1]);

xlabel('P_{\infty} [kPa]')
ylabel('\eta [-]');

legend('\eta_{thermal}', '\eta_{prop}', '\eta_0');

grid;
improvePlot;

set(f, 'Position', [10 10 900 600]);