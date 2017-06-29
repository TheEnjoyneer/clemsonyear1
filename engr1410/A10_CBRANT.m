%   Christopher Brant   ENGR 1410-625   2/16/16
%   Assignment A10

clear
clc 

%%  Main Program, Section 1: Patient Information
%   Problem Statement: Importing Excel information into MATLAB and
%   determining how much information is imported, as well as having the
%   user choose a name and provide an error message if a name is not chosen

[Data, Text] = xlsread('PersonalMeds_List2.xlsx', 'PatientInfo');
[TextRows, TextCol] = size(Text);
[DataRows, DataCol] = size(Data);

g = 9.8;

Names = Text(2:TextRows, 1);

% patient = menu('Select a Patient Name', Names);
patient = 0;
if patient == 0
    % ExtraName = input('Would you like to input a new name? ', 's');
    ExtraName = 'yes';
    if strcmpi(ExtraName, 'yes')
        % NewName = input('Enter the patient''s name: ', 's');
        NewName = 'Christopher Brant';
        if strcmpi(NewName, Names)
            warning('The name you entered already is in the system');
        else
            % NewW = input('Insert the patient''s weight in pounds-force: ');
            NewW = 215;
            % InputGender = menu('Choose the patient''s gender', 'Male', 'Female');
            InputGender = 1;
            if InputGender == 1
                NewGender = 'M';
            elseif InputGender == 2
                NewGender = 'F';
            elseif InputGender == 0
                error('Invalid Input: Program Terminated');
            end
            [FirstName, LastName] = strtok(NewName);
            PrintName = sprintf('%s, %s', LastName, FirstName);
            NewPatientInfo = {PrintName, NewW, NewGender};
            NewRow = TextRows + 1;
            NewPatLoc = sprintf('A%0.0f', NewRow);
            xlswrite('PersonalMeds_List2.xlsx', NewPatientInfo, 'PatientInfo', NewPatLoc);
        end
        if strcmpi(ExtraName, 'no')
            error('Nothing New to Add: Program Terminated');
        end
    end
    fprintf('Patient Name: %s\tGender: %s\n', PrintName, NewGender);
    PatName = NewName;
    NameRow = NewRow;
else
    fprintf('Patient Name: %s\tGender: %s\n', PatName, Text{patient + 1, 3});
    PatName = Names{patient, 1};
    NameRow = find(strcmp(Text(:,1), PatName) == 1);
end
%%  Main Program, Section 2: Symptom and Medication Information
%   Problem Statement: Importing Excel information into MATLAB and
%   determining how much information is imported, as well as having the
%   user choose a name and provide an error message if a name is not chosen

[Data2, Text2] = xlsread('PersonalMeds_List2.xlsx', 'MedicationInfo');
[Data2Rows, Data2Col] = size(Data2);
[Text2Rows, Text2Col] = size(Text2);

Problems = Text2(2, 2:Text2Col);
question = ['Select a Symptom for ' PatName];
% symptom = menu(question, Problems);
symptom = 5;
if symptom == 0
    error('Error: No Symptom Selected');
end

%%  Main Program, Section 3: Determine Medication Needed
%   Problem Statement: Create a function that determines the recommended
%   dosage of the necessary medicine.

[Data, Text] = xlsread('PersonalMeds_List2.xlsx', 'PatientInfo'); %Reread data in case a new name and info was added.

if patient ~= 0
MassPat = (Data(NameRow - 1, 1) / 0.225) / g;
Gender = Text2(5, symptom + 1);
else
    MassPat = (NewW / 0.225) / g;
    Gender = NewGender;
end
MassTab = Data2(2, symptom);
DoseVol = Data2(1, symptom);
DoseType = Text2(5, symptom + 1);

[Dose, Vol, DNum] = RecDose(MassPat, MassTab, DoseVol, Gender, DoseType);

%%  Main Program, Section 4: Inform the User
%   Problem Statement: Write output statements so that the information is
%   clear and easy to read for the user
 
fprintf('%-24sAilment:\t%s\n\t\t\t\t\t\tMedicine:\t%s\n', PrintName, Problems{1, symptom}, Text2{1, symptom + 1});
if strcmpi(Text2(5, symptom + 1), 'T')
    fprintf('\t\t\t\t\t\tDosage:\t\t%0.0f tablets\n', Dose);
    ExcelDose = sprintf('%0.0f tablets', Dose);
elseif strcmpi(Text2(5, symptom + 1), 'L')
    fprintf('\t\t\t\t\t\tDosage:\t\t%0.1f mL [%0.1f doses, %0.1f mL/dose]\n', Dose, DNum, Vol);
    ExcelDose = sprintf('%0.1f doses of %0.1f mL/dose', DNum, Vol);
end

%%  Main Program, Section 5: Record the information in the workbook
%   Problem Statement: Write the correct outputs back into their
%   corresponding cells in the Excel workbook.
Date = date();
PatientInfo = {Problems{1, symptom}, Text2{1, symptom + 1}, ExcelDose, Date};

ExcelRow = sprintf('E%0.0f', NameRow);

xlswrite('PersonalMeds_List2.xlsx', PatientInfo, 'PatientInfo', ExcelRow());