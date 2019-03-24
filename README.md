### matlab-email-efter-execution

`email_after_execution.m` is a MATLAB function that sends you an email after your code has finished running and reports how long it took to execute it. If execution fails, MATLAB emails you the error message. Designed for when you've left your script running in the office overnight, and now twist and turn in bed wondering how it's doing.

The function reuses two bits of code found on GitHub:
1) [matlabmail.m](https://gist.github.com/dgleich/9243281) -- gist published by David Gleich
2) [seconds2human.m](https://github.com/rodyo/FEX-seconds2human) -- repo by Rody Oldenhuis

You might need to switch off the two-step verification in order to make matlabmail work. Check out [the developer's blog](https://dgleich.wordpress.com/2014/02/27/get-matlab-to-email-you-when-its-done-running/) for details.
