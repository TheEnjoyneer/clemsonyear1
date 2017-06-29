%   Christopher Brant   ENGR 1410-625   2/15/16
%   Assignment A9

clear
clc

%%  Problem 1: Blood Pressure
%   Problem Statement: Write a program that will take a user's age and 
%   blood pressure readings into account, and determine if they have high
%   blood pressure.

% age = input('Input your age: ');
% SBP = input('\nInput your Systolic Blood Pressure: ');
% DBP = input('\nInput your Diastolic Blood Pressure: ');
age = 20;
SBP = 100;
DBP = 100;

YmaxSBP = 120;
OmaxSBP = 132;
YmaxDBP = 81;
OmaxDBP = 83;
if age > 24 || age < 15
    error('Program Terminated: You should not use this method of diagnosis at your age');
elseif age <=19
    if SBP > YmaxSBP || DBP > YmaxDBP
        diagnosis = 'you have high blood pressure';
    else 
        diagnosis = 'you have normal blood pressure';
    end
else
    if SBP > OmaxSBP || DBP > OmaxDBP
        diagnosis = 'you have high blood pressure';
    else
        diagnosis = 'you have normal blood pressure';
    end
end

fprintf('\nYour diagnosis is that %s.\n\n', diagnosis);

%%  Problem 2: ICA 19-12
%   Problem Statement: Create a program that determines whether or not a
%   person is qualified to ride different rides at an amusement park.

%   The printed lines including the names of each section are only added as
%   a way of verifying which response statement corresponds to which ride.

%   a) The Spinning Beast
% A = input('How old are you?  ');
% H = input('How tall are you in inches?  ');
% HC = input('Do you have a heart condition?  ', 's');
% P = input('If you are pregnant respond with a 1.  If not, enter 0.  ');
A = 15;
H = 65;
HC = 'no';
P = 0;
fprintf('The Spinning Beast');
if A < 17 || H < 62 || (strcmpi('Yes', HC) == 1) || P == 1
    fprintf('\nSorry, you cannot ride this ride\n');
end

%   b) The Lame Train
% A = input('How old are you?  ');
% H = input('How tall are you in inches?  ');
A = 9;
H = 50;
fprintf('The Lame Train');
if A > 8 && H > 40
    fprintf('\nSorry, you cannot ride this ride\n');
end

%   c) The MATLAB House of Horror
% A = input('How old are you?  ');
% HC = input('Do you have a heart condition?  ', 's');
A = 21;
HC = 'no';
fprintf('The MATLAB House of Horror');
if A >= 17 || (strcmpi('No', HC) == 1)
    fprintf('\nWelcome to the MATLAB House of Horror!\n');
end

%   d) The Neck Snapper
% A = input('How old are you?  ');
% H = input('How tall are you in inches?  ');
% HC = input('Do you have a heart condition?  ', 's');
% P = input('If you are pregnant respond with a 1.  If not, enter 0.  ');
A = 17;
H = 72;
HC = 'no';
P = 1;
fprintf('The Neck Snapper');
if A >= 16 && H > 65 && ((strcmpi('Yes', HC) == 0) || P == 0)
    fprintf('\nWelcome to The Neck Snapper!\n');
end

%   e) The Bouncy Bunny
% A = input('How old are you?  ');
A = 5;
fprintf('The Bouncy Bunny')
if A >= 3 && A <= 6
    fprintf('\nThis ride is made just for you!\n');
end