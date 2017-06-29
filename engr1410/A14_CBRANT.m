%   Christopher Brant   ENGR 1410-625    3/21/16
%   Assignment A14

clear
clc
close all

%%  Assignment A14B

% UserVec = input('Please enter a 1 x 5 vector of numbers: ');
UserVec = [1 2 3];
[UserRow, UserCol] = size(UserVec);
if UserRow == 5 && UserCol == 1
    warning('You entered a 5 x 1 vector, it has now been transposed to be a correct 1 x 5 vector')
    UserVec = UserVec';
    [UserRow, UserCol] = size(UserVec);
end
count = 1;
while ~(UserRow == 1 && UserCol == 5)
    if count == 3
        error('You failed to input a correctly sized vector')
    end
    warning('You have entered an incorrectly sized matrix')
    % UserVec = input('Please enter a new 1 x 5 vector of numbers: ');
    UserVec = [1 2 3 4 5];
    [UserRow, UserCol] = size(UserVec);
    if UserRow == 5 && UserCol == 1
    warning('You entered a 5 x 1 vector, it has now been transposed to be a correct 1 x 5 vector')
    UserVec = UserVec';
    [UserRow, UserCol] = size(UserVec);
    end
    count = count + 1;

end
fprintf('\tThe resulting 1 x 5 vector is:');
fprintf('\t%0.0f\t%0.0f\t%0.0f\t%0.0f\t%0.0f\n', UserVec(1), UserVec(2), UserVec(3), UserVec(4), UserVec(5));