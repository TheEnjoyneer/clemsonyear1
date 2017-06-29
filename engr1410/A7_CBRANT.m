%   Christopher Brant   ENGR 1410   2/9/16
%   Assignment A7

clear
clc

%%  Question One
%   Problem Statement: Importing information from Excel and referencing information from there

[DR1, TR1] = xlsread('Voltage_Capacitance.xlsx', 'A:C');

[DR2, TR2] = xlsread('Voltage_Capacitance.xlsx', 'E:I');

%PartNum = menu('Choose a Part Number', TR1{2:13,1});
PartNum = 12;

fprintf('Part number %s has a voltage of %0.0f volts and a capacitance of %0.2f microfarads.\n\n', TR1{PartNum + 1, 1}, DR1(PartNum, 1), DR1(PartNum, 2));

Freq = DR2(2:11, 1);
FreqCell = num2cell(Freq);
%FreqChoice = menu('Choose a Frequency', FreqCell);
FreqChoice = 6;

Resist = DR2(1, 2:5);
ResistCell = num2cell(Resist);
%ResistChoice = menu('Choose a Resistance', ResistCell);
ResistChoice = 3;

fprintf('Input Frequency = %0.0f Hz\n\n', DR2(FreqChoice + 1, 1));
fprintf('Resistor = %0.0f Ohms\n\n', DR2(1, ResistChoice + 1));
fprintf('\tMaximum capacitor voltage = %0.2f V\n', DR2(FreqChoice + 1, ResistChoice + 1));

%%  Question 2
%   Problem Statement: Learning to import information and then write a
%   calculated volume to another sheet in that Excel workbook.

[WidgetD, WidgetT] = xlsread('Widgets.xlsx', 'C:G');

Volume = pi * WidgetD(:,1) .* (WidgetD(:,2) .^ 2);

PartHeadings = WidgetT(1:21,1);
VolumeHeading = {'Volume [in^3]'};
xlswrite('Widgets.xlsx', PartHeadings, 'Cylinder Volumes', 'A1:A21');
xlswrite('Widgets.xlsx', VolumeHeading(1,1), 'Cylinder Volumes', 'B1');
xlswrite('Widgets.xlsx', Volume, 'Cylinder Volumes', 'B2:B21');