%   Christopher Brant   ENGR 1410-625   2/11/16
%   Assignment A8

clear
clc

%%  Problem 1: Water Phase with Error Checking
%   Problem Statement: Create a program that informs the user of the phase
%   and temperature in degrees Celsius of water at a user input temperature

%temp = input('Insert temperature in deg F:   ');
temp = 50;
tempC = (temp - 32) * (5 / 9);

if tempC < -273
    error('Invalid Input: Temperature is below Absolute Zero')
end

if tempC < 0 && tempC > -273
    phase = 'Solid';
elseif temp >= 0 && temp <= 100
    phase = 'Liquid';
else
    phase = 'Gas';
end

fprintf('The temperature of your sample of water is %0.0f deg C and it is in the %s phase\n', tempC, phase);

%%  Problem 2: Review 19-7
%   Problem Statement: Create a program where the user enters an altitude
%   in meters, including errors or warnings, the program should calculate
%   the temperature and pressure in kPa at that altitude.

%H = input('Altitude in meters:   ');
H = 15000;

Tt = 15.04 - (0.00649 * H);
Pt = 101.29 * (((Tt + 273.1) / 288.08) ^ 5.256);
Tlo = -56.46;
Plo = 22.65 * exp(1.73 - 0.000157 * H);
Tup = -131.21 + (0.00299 * H);
Pup = 2.488 * (((Tup + 273.1) / 216.6) ^ -11.388);

if Tt < -273 || Tup < -273 || Tlo < -273
    error('Invalid Input: Temperature entered is below Absolute Zero');
end

if H < 11000
    atm = 'Troposphere';
    T = Tt;
    P = Pt;
elseif H > 11000 && H < 25000
    atm = 'Lower Stratosphere';
    T = Tlo;
    P = Plo;
elseif H > 25000
    atm = 'Upper Stratosphere';
    T = Tup;
    P = Pup;
end

fprintf('An altitude of %0.0f is in the %s with a temperature of %0.0f degrees C and pressure of %0.0f kPa.\n', H, atm, T, P);
