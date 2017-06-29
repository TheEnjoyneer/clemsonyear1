%   Christopher Brant   ENGR 1410-625   3/1/16
%   Assignment A11

clear
clc
close all

figure('Color', 'w')

%%  Figure 1: ICA 18-15 (revised)
%   Problem Statement: Create a basic proper plot in MATLAB

Current = [0.5 1.25 1.5 2.25 3.0 3.2 3.5];
Power = [1.2 7.5 11.25 25 45 50 65];

plot(Current, Power, 'or', 'MarkerSize', 16)

axis([0 4 0 70])

title('ICA 18-15 CBRANT')

xlabel('Current (I) [A]')
ylabel('Power (P) [W]')

grid on

saveas(gcf, 'A11_F1_CBRANT', 'png')

%%  Figure 2: ICA 18-17 (revised)
%   Problem Statement: Create a proper plot using multiple series of data.

clear
clc
close all

LF = [80 200 400 600 750 1250 1400];
Incan= [16, NaN, 38, 55, 68, NaN, 105];
CFL = [NaN, 5, 10, NaN, 18, 27, 33];
LED = [1.7, 3, 6, 9, 12, NaN, NaN];
 
 
plot(LF, Incan, '^b', 'MarkerFaceColor', 'b', 'MarkerSize', 12)
hold on
plot(LF, CFL, 'gs', 'MarkerFaceColor', 'g', 'MarkerSize', 12)
hold on
plot(LF, LED, 'kd', 'MarkerSize', 12)

xlabel('Luminous Flux (LF) [lm]')
ylabel('Electrical Consumption (EC) [W]')

grid on

axis([0 1500 0 110])

title('ICA 18-17 CBRANT')

legend('Incandescent', 'CFL', 'LED', 'Location', 'Best')

saveas(gcf, 'A11_F2_CBRANT', 'png')