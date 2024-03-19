# Visual Studio Code

Visual Studio Code (or VS Code) is the preferred editor for using PowerShell files. It's open-source, cross-platform and extensible. It supports many different languages like PowerShell, Python, JavaScript, HTML, SQL, etc.

Other editors might include:
- Visual Studio: this is the full-blown IDE (integrated development environment). For PowerShell it migt be overkill.
- Windows PowerShell ISE (integrated scripting environment). This is unofficially end-of-life. It is included with Windows, and not useable on other operating systems. Also, it's optimized for PowerShell, and not other languages or file formats.
- Notepad++. Just like VS Code, this is a free, multi language editor. It can process many different files and formats. 

**Bottom line:** make sure your editor has the features that you need for working with PowerShell files. Integration with version control, a proper linter, and an adaptable GUI might be important aspects.

# Install
Install Microsoft Visual Studio Code by downloading it from the Microsoft website and following the default installation procedure.
[https://code.visualstudio.com/download]()

# Clone a repository
1. Using a webbrowser, navigate to a repository you want to clone.
1. Click the Clone button in the top-right corner.
1. In the pop-up that follows, click the Clone in VS Code button.
1. Confirm the pop-up with the "Open" button.
1. Important! Be carefull in selecting the correct folder. In the next pop-up, a Explorer window appears, asking to select a folder to store the repository. To prevent replication conflicts, this should **not be a OneDrive folder**, or any other folder that is replicated in any way. Ideally, create a new folder (if it doesn't already exist) in the root of the C-Drive, with the name **Git**. Select this folder as the repository folder.
1. Make sure the C:\Git folder is open, and click the "Select as Repository Destination" button.

## Congratulations!
You just cloned a repository to your local drive.

## Do you want to commit changes, or publish/store files? 
If you didn't configure the local Git folder correctly, you cannot commit changes, publish or store files. Here's how to configure a name and e-mail address (you're only required to do this once for every repository).
1. Open a PowerShell prompt (or a command prompt).
1. Navigate to the repository folder (for example: ```CD C:\Git\MyProject```)
1. Enter the following commands and replace the values with your actual name and e-mail address.
1. ```git config user.name "John Doe"```
1. ```git config user.email "johndoe@company.com"```
1. Close the window.

The name and email address are stored with every change you make to a file. This way it's easier to contact the author about changes. The name and e-mail address are not verified. For good practice, use your real name and e-mail address.

# Working with the repo
1. Start Visual Studio Code.
1. Open the folder that is under version control by clicking **File, Open Folder (Ctrl-K, Ctrl-O)** and selecting the specific folder (for example: **C:\Git\MyProject**).
1. Create a new file (**Ctrl-N**), or open an existing file.
1. Make the changes in the file.
1. When you're done, click the **Source Control** button in the navigation pane on the left **(Ctrl-Shift-G)**.
1. Enter a short description for the changes and click **Commit**.
