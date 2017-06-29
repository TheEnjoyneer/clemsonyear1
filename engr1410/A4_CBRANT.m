%   Christopher Brant   ENGR 1410-625   1/20/2016

%% Section 1: Patient Information
%   Problem Statement: Creating arrays in which patient names are stored.

clear
clc

% Variables are all patient name strings
P1F = 'Ima';
P1L = 'Tiger';
P2F = 'Preston';
P2L = 'Holtzendorff';
P3F = 'Thomas';
P3L = 'Clemson';
P4F = 'Anna';
P4L = 'Calhoun';

% Create another patient, myself
P5F = 'Christopher';
P5L = 'Brant';

Patient_Names = {P1F P2F P3F P4F P5F; P1L P2L P3L P4L P5L}

%% Symptom and Medicine Information
%   Problem Statement: Learning to create cell arrays using character
%   strings and numerical inputs

% Variables in the cell array rows will show the following:
% Symptom
% Medicine
% Dose Volume [mL/dose]
% Dose Mass[g/dose]
% Dose Type

Meds = {'Cold' 'Flu' 'Migraine'; 'Achoo' 'Chill' 'HAche'; 3.6 5 4; 9 16 11; 'L' 'T' 'T'}

%% Extracting Information
%   Problem Statement: Extracting information from individual cells.

% Question a
Patient_1 = {Patient_Names{1,3} Patient_Names{2,3}}

% Question b
Flu_Med = 5 * [Meds{3,2}(1) Meds{4,2}(1)]

% Question c
Liquid = {Meds{1:5,1}}'

% Question d
% Density is in g/mL
Density_HAche = Meds{4,3}(1) / Meds{3,3}(1)

% Question e
% Density here is also in g/mL
Density_All = [(Meds{4,1}(1) / Meds{3,1}(1)) (Meds{4,2}(1) / Meds{3,2}(1)) (Meds{4,3}(1) / Meds{3,3}(1))]

% Question f
Meds_Rearranged = [Meds{3,1:3}; Meds{4,1:3}; Density_All]