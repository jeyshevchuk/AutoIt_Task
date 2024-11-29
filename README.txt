Hello! Here is my task. When the script is launched, it allows you to select a browser for execution (Chrome, Edge, Firefox).

I attempted to find the "Download Free" button using CLASS, CSS, or ID (ControlClick) so that the click would not rely on coordinates, making the script functional on any machine. However, I was unsuccessful. IE-specific functions are also not suitable here, as the task required creating a cross-browser script.

I would like to add that, in my opinion, for browser automation (during testing), it's better to use Selenium, Selenide, or Playwright (interaction with web elements is much easier to implement). On the other hand, AutoIt is more suitable for automating interactions with windows and programs on a computer (outside of a browser).

This task could have been implemented using Selenide + Java + AutoIt in the following way:

Launch the browser and navigate to the website - Selenide.
Download the Setup.exe file - Selenide.
Run the file - AutoIt (run script from Java).
Perform the installation (click the "Next" button) - AutoIt.
