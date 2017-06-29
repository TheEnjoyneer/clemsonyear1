%   Christopher Brant   ENGR 1410-625   2/5/16
%   Assignment A6 Part B

clear
clc

%   Set cell array of values
Mat = {'Aluminum' 'Cadmium' 'Iron' 'Tungsten'};
MatCp = [897 231 450 134];
FinalT = 50;        %[deg C]

% choice = menu('Select a material', Mat);
choice = 3;

fprintf('Enter mass [g] and temperature [deg C] of %s as [m T]:', Mat{1,choice});
% functIO = input(' ');
functIO = [6500 325];

functIO(1,3) = MatCp(1,choice);

[ER, VG] = ThermE(functIO(1,1), functIO(1,2), functIO(1,3));

Mass = functIO(1,1) / 1000;

fprintf('\n\nFor the %0.1f kg %s rod with an initial temperature of %0.0f [deg C]\n', Mass, Mat{1,choice}, functIO(1,2));
fprintf('\tEnergy Removed [J]\t\t%0.1e\n\tVolume Glycerol [gal]\t%0.2f\n', ER, VG);
