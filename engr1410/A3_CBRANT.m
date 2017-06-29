% Christopher Brant     ENGR 1410-625   January 12, 2016
% Problem Statement: Working with vectors we are practicing using the
% max command in different situations and for different purposes.

clear
clc

%% Problem 1: Modified Problem ICA 16-5, ICA 16-6 in TLAE, 3e

% Define all vector variables
V1 = [125 367 498 24 63 0.25 543 32];
V2 = [75 32 0.067 75];
V3 = [V2 V2];
V4 = [98 56 56 1 98 56 87 98];
V5 = [5 10 100 0.5 67 87];

% Question 1: Create a vector including only the unique numbers from V4

UV = [unique(V4)]

% Question 2: Create a vector using the designated instructions

M = [V1; V1 + 5; V3; V4 * 3]

% Question 3: Find the maximum value in vector V1

V1max = max(V1)

% Question 4: Create a 1x2 vector of where the minimum value in vector M
% is, locating its row and column in the matrix.

MinM = min(min(M));
[MinMR, MinMC] = find(M == MinM)
    
% Question 5: Create a vector that locates every instance of the number 32
% in vector M.

[MR, MC] = find(M == 32)

%% Problem 2: Chapter 17, Review Question 3
% Problem Statement: Using a known volume,specific gravity, and
% gravitational acceleration, compute the weight of a rod in units of
% pounds-force.

% Variables:
% V - volume [m^3]
% SG - specific gravity [unitless]
% g - gravitational acceleration [m/s^2]
% w - weight [N]
% fw - final weight [pounds-force]
% m - mass [kg]
% cf - force conversion factor of 1 N = 0.225 lbs-f

% Set input variables
V = 0.3;
SG = 4.7;
g = 1.25;
cf = 0.225;

% Calculate the mass
m = SG * V;

% Calculate the weight in Newtons
w = m * g;

% Calculate the weight in pounds-force
fw = w * cf

%% Problem 3: Chapter 17, Review Question 8
% Problem Statement: Find the density of tribromoethylene using the given
% surface pressure and the hydrostatic pressure formula with given values
% for height, gravity, surface pressure, and total pressure.

% Variables: 
% Ps - surface pressure [atm]
% Pt - total pressure [atm]
% Ph - hydrostatic pressure [atm]
% H - height [m]
% h - initial height [ft]
% g - gravitational constant [m/s^2]
% d - density [kg/m^3]
% cf - height conversion factor [ft/m]
% Pcf - pressure conversion factor [Pa/atm]
% P - calculated pressure [Pa]

% Set input variables
g = 9.8;
Ps = 3;
Pt = 5;
cf = 3.28;
h = 25;
Pcf = 101325;

% Calculate the hydrostatic pressure
Ph = Pt - Ps;

% Convert the height from feet to meters
H = h / cf;

% Calculate the pressure in pascals for your equation
P = Ph * Pcf;

% Calculate the density 
d = P / (g * H)
