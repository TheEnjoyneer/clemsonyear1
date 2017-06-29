%   Christopher Brant  ENGR 1410-625    1/25/2016
%   Assignment A5_CBRANT

clear
clc

%%  Problem 1: Modified Review 18-6
%   Writing a MatLab program to convert a temperature input from the user
%   into a different unit system

%   Test Case
%   Input:
%   temperature = 32 [deg F]
%   unit = K
%   Expected Output:
%   The equivalent temperature to 32 deg F is 273 K

%   Assign variables
%   temperature - [degrees F]
%   degC - temperature in celsius [degrees C]
%   K - temperature in Kelvin [K]
%   degR - temperature in Rankine [degrees R]

%   Create a cell array of menu choices
options = {'deg C' 'K' 'deg R'};

%   Print instructions and input options
%   temperature = input('Enter the temperature [deg F]: ');
temperature = 32;   %[deg F]
degC = (temperature - 32) * (5 / 9);
K = (temperature - 32) * (5 / 9) + 273;
degR = temperature + 460;
conversions = [degC K degR];

%   Print menu options for which unit system to convert to
%   unit = menu('Choose which unit to convert to', options);
unit = 2;
fprintf('Enter the temperature [deg F]: %0.0f\t\t\tMenu Choice: %s\nThe equivalent temperature to %0.0f deg F is %0.0f %s\n', temperature, options{1,unit}, temperature, conversions(1,unit), options{1,unit});



%%  Problem 2: Review 18-3
%   Problem Statement: Write a program in which the user inputs a volume
%   and calculate the weight of the rod in pounds-force.

%   Test Case
%   Input:
%   V = 0.5 [m^3]
%   Expected Output:
%   The weight of the rod is 661 pounds force

%   Variables:
%   g - gravity on Callisto [m/s^2]
%   SG - specific gravity [unitless]
%   V - volume [m^3]
%   m - mass [kg]
%   dw - density of water [kg/m^3]
%   F - force of object [N]
%   fcf - force conversion factor [pounds-force/N]
%   w - weight of object [pounds-force]

%   Establish constant variables
g = 1.25;    %[m/s^2]
SG = 4.7;    %[unitless]
dw = 1000;   %[kg/m^3]
fcf = 0.225; %[lbs-f/N]

%   Ask user for volume input
%   V = input('\nEnter the volume of the rod [cubic meters]: ');
V = 0.5;     %[m^3]

%   Convert from SG into mass using user input
m = (SG * dw) * V;

%   Calculate force using mass and gravity
F = m * g;

%   Convert from force in Newtons to force in pounds-force
w = F * fcf;

%   Print final statement to the screen
fprintf('The weight of the rod is %0.0f pounds force\n', w);

%%  Problem 3: Personalized Medicine
%   Problem Statement: Using menu input, we have the screen print patient
%   information along with their symptoms, medicine, and specific gravity
%   of their medications
%   Original assignment A4_CBRANT was copied for its variables, but
%   modified to complete the assigned tasks

%   Test Case
%   Input:
%   patient = 'Christopher Brant' or 5(in menu output format)
%   symptom = 'Flu' or 2(in menu output format)
%   Expected Output:
%   Patient: Christopher Brant
%       Symptom:    Flu
%      Medicine:   Chill
%       SG:         2.50

Patient_Names = {'Ima Tiger' 'Preston Holtzendorff' 'Thomas Clemson' 'Anna Calhoun' 'Christopher Brant'};
    
% Variables in the cell array rows will show the following:
% Symptom
% Medicine
% Dose Volume [mL/dose]
% Dose Mass[g/dose]
% Dose Type

Meds = {'Cold' 'Flu' 'Migraine'; 'Achoo' 'Chill' 'HAche'; 3.6 5 4; 9 16 11; 'L' 'T' 'T'};

% Density of medications
Density_All = [(Meds{4,1}(1) / Meds{3,1}(1)) (Meds{4,2}(1) / Meds{3,2}(1)) (Meds{4,3}(1) / Meds{3,3}(1))];

% SG of medications in g/mL is the same as density, as density of water in
% g/mL is just 1 g/mL
SG_All = Density_All;

% Choose patient name from menu
% patient = menu('Select a Patient Name', Patient_Names);
patient = 5;     %Since my name 'Christopher Brant' would show up as an output of 5 from the menu, patient = 5
name = Patient_Names{1,patient};

% Choose symptom from menu
% symptom = menu('Select a Symptom for the chosen patient', 'Cold', 'Flu', 'Migraine');
symptom = 2;    %Since the symptom 'Flu' is the second option in the menu and would output 2, symptom = 2
choice = Meds{1, symptom};
Medicine = Meds{2, symptom};

% Set all final print screen commands in their if loops
fprintf('Patient: %s\n\tSymptom:\t%s\n\tMedicine:\t%s\n\tSG:\t\t\t%0.2f\n', name, choice, Medicine, SG_All(1,1));

