# Getting started with PowerShell

## Task 1: Start PowerShell
1. Rightclick the Windows start button, and click **Run**.
1. Enter **PowerShell** and click OK.
1. On the taskbar, right-click the Windows PowerShell icon and then click **Pin to taskbar**.


## Task 2: Configure the PowerShell console
1. Click the blue icon in the upper-left corner of the PowerShell window.
1. Click **Properties**.
1. Select the **Font** tab.
1. Configure a larger font size if desired.
1. Click the **Layout** tab.
1. Make sure the Screen Buffer Size Width is not larger than the Window Size width. If it is, a horizontal scrollbar will be displayed, which is not desirable.
1. Close the properties window by pressing OK and return to the PowerShell console window.


## Task 3: Keyboard navigation
1. In the PowerShell console window, type ```Get-Serv``` and press **Tab** on your keyboard. PowerShell will complete the command to ```Get-Service```.
1. Press Enter. This will display a service listing.
1. In the PowerShell console window, type ```Get-Proc``` and press **Tab**. PowerShell will complete the command to ```Get-Process```.
1. Press Enter. This will display a process listing.
1. In the PowerShell console window, type ```Get-Process -Na``` and press **Tab**. PowerShell will complete the command to ```Get-Process -Name```.
1. Make sure you complete the command to this: ```Get-Process -Name csrss``` and press Enter.
1. This will show a list of processes with the name **csrss**.
1. Press **arrow up** on your keyboard to show the last command.
1. Use the arrow up and down keys to scroll through the last few commands.
1. Press **ESC** on your keyboard to clear the input line.
1. Press **arrow up** to show the last command.
1. Press **home** on your keyboard to set the cursor at the beginning of the command.
1. Press **end** to set the cursor at the end of the command.
1. Press **ESC** again to clear the input line.


## Task 4: Open the Integrated Scripting Environment (ISE)
### Note: this only works in Windows.
1. With the PowerShell console open, type **powershell_ise** and hit Enter.
1. A graphical editor window will open.
1. On the taskbar, right-click the Windows PowerShell ISE icon and then click **Pin to taskbar**.
1. On the Windows PowerShell ISE toolbar, click **View** in the menu bar, and click **Show Script Pane  Ctrl-R**.
1. On the Windows PowerShell ISE toolbar, click **View** in the menu bar, and click **Show Script Pane Maximized  Ctrl-3**.
1. Use the slider in the lower-right corner of the window to adjust the font size.
1. On line 1, type ```Get-Process``` in the editor window and press the **Run Script** button in the toolbar.
1. This wil display a process listing.
1. Close the Editor by clicking **File** in the menu bar, and **Exit**.
1. Do not save the file.

