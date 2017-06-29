%   Christopher Brant   ENGR 1410-625   3/11/16
%   Assignment A13

clear
clc
close all
figure('color', 'w')

%%  Figure 1: Includes plot from #s 18-18, 18-19, 18-21
Data1 = [0.5 0.75 1 1.5 2 2.25 2.5 2.75; 0.004 0.04 0.13 0.65 3 8 18 22];
Diameter = Data1(1, :);
Power = Data1(2, :);

% Review 18-18
loglog(Diameter, Power, '>b')
xlabel('Diameter (D) [ft]')
ylabel('Power (P) [hp]')
axis([0 3 0 25])
grid on
set(gca, 'xscale', 'log', 'yscale', 'log')
title('Power Produced by Different Sized Impellers - CBRANT')

hold on

% Review 18-19
C1 = polyfit(log10(Diameter), log10(Power), 1);
m1 = C1(1);
b1 = 10 ^ C1(2);
Di = [0:0.25:3];
PowerTrend = b1 * power(Di, m1);
plot(Di, PowerTrend, '-g')
sprintf('
% Review 18-21
P = @(x) (0.25) * power(x, 5);
fplot(P, [0 3])

legend('Review 18-18', 'Review 18-19', 'Review 18-21', 'Location', 'NorthWest')

saveas(gcf, 'A13_F1_CBRANT', 'png')

%%  Figure 2: Includes plot #s 18-25, 18-26, 18-28
close all
figure('color', 'w')
Data2 = [0 5 7 16 25 31 37; 0.8 0.4 0.2 0.09 0.007 2E-04 8E-06];
Years = Data2(1, :);
GearSize = Data2(2, :);

% Review 18-25
semilogy(Years, GearSize, 'ok')
xlabel('Years from 1967')
ylabel('Minimum gear size [mm]')
grid on
axis([0 40 0 1])
set(gca, 'xtick', [0:5:40], 'yscale', 'log')
title('Minimum Gear Sizes since 1967 - CBRANT')

hold on

% Review 18-26
C2 = polyfit(Years, log(GearSize), 1);
m2 = C2(1);
b2 = C2(2);
year = [0:2.5:40];
SizeTrend = b2 * exp(m2 * year);
plot(year, SizeTrend, 'r')

% Review 18-28
MGS = @(x) 2.5 * exp(-0.5 * x);
fplot(MGS, [0 40])

legend('Review 18-25', 'Review 18-26', 'Review 18-28')

saveas(gcf, 'A13_F2_CBRANT', 'png')