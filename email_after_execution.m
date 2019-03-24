function email_after_execution(myfunc, recipient, sender, sender_psswd)

% This function sends you an email after your code has finished running and
% reports how long it took to execute it. If execution fails, MATLAB emails
% you the error message. Designed for when you've left your script running
% in the office overnight, and now are tossing and turning in bed wondering
% how it's doing.

% The function reuses two bits of code found on GitHub:
% 1) matlabmail.m -- gist published by David Gleich: https://gist.github.com/dgleich/9243281
% 2) seconds2human.m -- repo by Rody Oldenhuis: https://github.com/rodyo/FEX-seconds2human

% You might need to switch off the two-step security verification in order
% to make matlabmail work. Check out the developer's blog for details:
% https://dgleich.wordpress.com/2014/02/27/get-matlab-to-email-you-when-its-done-running/


% created by Katya Delikishkina
% last updated: 2019-03-24

% example:
% email_after_execution(@my_test_function, 'recipient_address@gmail.com', 'sender_address@gmail.com', 'very$ecurePa$$word')

% Add subdirectories to path
addpath('matlabmail');
addpath('FEX-seconds2human');

try
    tstart = tic; % start the timer    
    myfunc(); % try to execute the function
    telapsed_sec = toc(tstart); % stop the timer
    % convert to human-readable time format:
    telapsed_human = seconds2human(telapsed_sec, 'full');
    
    % If the code execution was successful, send an email specifying the
    % amount of time it took to run it
    message = ['I finished running the script, yay! ' ...
        sprintf('It took me %s to execute it.', telapsed_human)];
    matlabmail(recipient, message, 'Hello from MATLAB', ...
        sender, sender_psswd);
    clearvars;

% If the code execution failed, email the error message
catch ME
    message = ME.message;
    matlabmail(recipient, message,...
        'MATLAB: If at first you don''t succeed, try again!', ...
        sender, sender_psswd);
    clearvars;
end

