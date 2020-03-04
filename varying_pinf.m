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
Pinf = linspace(0, 100);

nth = zeros(1, length(Pinf));
nprop = zeros(1, length(Pinf));

%% Run

for i = 1:length(Pinf)
    [~,~,~,~,~,~,nth(i),nprop(i)] = ramjet(Tinf, Pinf(i), Minf, Mx, M2, Tb, F);
end

%% Plots

f = figure;
hold on;

plot(Pinf, nth);
plot(Pinf, nprop);

ylim([0, 1]);

xlabel('P_{\infty} [kPa]')
ylabel('\eta [-]');

grid;
improvePlot;

set(f, 'Position', [10 10 900 600]);