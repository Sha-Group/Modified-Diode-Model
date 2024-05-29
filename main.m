%% Script for applying the MDB model to experimental JV data
% -------------------------------------------------------------------------
% The JV data used in this script are imported from an example file. You
% can create a txt file containing your experimental JV data in the same
% format, and apply the MDB model to your data by specifying the `fileName`
% variable.
%
% @ Author: Minshen Lin
% @ Institution: Zhejiang University
%
% @ LICENSE
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published
% by the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% -------------------------------------------------------------------------

clear; clc; % Clear workspace

addpath(genpath(pwd)); % Include directories

perov = Device(); % Initialize Device object with default constructor
perov.L = 750e-7; % Specify the thickness of the active layer [cm]
perov.tBulk = 398e-9; % Specify the bulk SRH recombination lifetime [ns]
perov.Eg = 1.55; % Specify the active layer bandgap [eV]

fileName = "/Experimental Data/passivated_reverse_scan.txt"; % Load data

dataJV = DataPreconditioner(fileName).dataJV; % Data preconditioning

retrievedParams = fittingMD(perov, dataJV); % MDB model fitting

calJV = solver(perov, dataJV, retrievedParams); % Numerically solve JV

plotJV(dataJV, calJV, retrievedParams); % Plot JV curves

% Loss analysis
PCEs = lossAnalysis(dataJV, calJV, perov, retrievedParams);
plotNormPCEGain(PCEs);
