%   Christopher Brant   ENGR 1410-625   3/2/16
%   Assignment A12

clear
clc
close all

%%  Section 1: User Input
%   Problem Statement: Collecting information from the user.
load('BatCost.mat')
BatChoice = menu('Choose a bat material', Materials);
if BatChoice == 0
    error('You failed to choose a bat material')
end
SellPrompt = sprintf('Enter the selling price of a single %s bat:  ', Materials{BatChoice, 1});
% SellPrice = input(SellPrompt);
SellPrice = 15.00;

% fprintf('Enter in the following format:\n[number bats produced per week, total number of weeks]\n');
% ProdNums = input('Enter as [#/week, total weeks]:  ');
ProdNums = [216 37];

BatsProdPerWeek = ProdNums(1, 1);
WeekTot = ProdNums(1, 2);
if WeekTot > 52
    error('You have entered too many weeks');
end

% fprintf('Are you planning to upgrade the equipment?  ');
% upgrade = input('Enter yes or no:  ', 's');
upgrade = 'yes';

if strcmpi(upgrade, 'yes')
    % FixedUpCost = input('Enter estimated cost of upgrade:  ');
    FixedUpCost = 59750;
else
    FixedUpCost = 0;
end

%%  Section 2: Breakeven Calculations
%   Problem Statement: Calculate all costs and the breakeven point
BatsProd = BatsProdPerWeek * WeekTot;
CostPerBat = Cost(1, BatChoice) / 25;
VarCost = CostPerBat + LECost;
Revenue = SellPrice * BatsProd;
TotalCost = FixedUpCost + (BatsProd * VarCost);
Breakeven = FixedUpCost / (SellPrice - VarCost);
Profit = Revenue - TotalCost;
if Profit <= 0
    error('The current values entered will not make any money.');
end

%%  Section 3: Output to Command Window
fprintf('Producing %0.0f %s bats a week for %0.0f weeks = %0.0f total bats\n', BatsProdPerWeek, Materials{BatChoice, 1}, WeekTot, BatsProd);
fprintf('\tSelling Price per bat:        $%8.2f\n', SellPrice);
fprintf('\tTotal Variable Cost per bat:  $%8.2f\n', VarCost);
fprintf('\tFixed Cost of upgrade:        $%8.2f\n\n', FixedUpCost);
fprintf('\tProfit:           $%0.1e\n', Profit);
BreakForm = sprintf('%0.2g', Breakeven);
BreakForm2 = str2num(BreakForm);
fprintf('\tBreakeven Point:  %0.0f bats\n', BreakForm2);

%%  Section 4: Output to Graph
figure('color', 'w')

BatsProdAxis = [0:1000:BatsProd];
Revenue = SellPrice * BatsProdAxis;
TotalCost = FixedUpCost + (BatsProdAxis * VarCost);
BreakevenPoint = [Breakeven Breakeven];

plot(BatsProdAxis, TotalCost, '-.r', BatsProdAxis, Revenue, ':g', 'LineWidth', 3)

if FixedUpCost > 0
    hold on
    plot(BreakevenPoint, [0 85000], '-k', 'LineWidth', 3)
    legend('Cost', 'Revenue', 'Breakeven Point', 'Location', 'NorthWest')
else
    legend('Cost', 'Revenue', 'Location', 'NorthWest')
end
XaxisEnd = round(BatsProd, -3);
axis([0 XaxisEnd 0 90000])
set(gca, 'xtick', [0:1000:XaxisEnd], 'ytick', [0:10000:90000])

xlabel('Number of Bats (Nb) [#]')
ylabel('Cost, Revenue (C,R) [$]')

grid on

TitleName = sprintf('%s Bat Production: CBRANT', Materials{BatChoice, 1});

title(TitleName)

saveas(gcf, 'A12_CBRANT', 'png')