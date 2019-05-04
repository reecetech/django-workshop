# Install Python

Django is written in Python. We need Python to do anything in Django. Let's start by installing it! We want you to install the latest version of Python 3, so if you have any earlier version, you will need to upgrade it. If you already have version 3.4 or higher you should be fine.

### Install Python: Windows   
    
> First check whether your computer is running a 32-bit version or a 64-bit version of Windows, on the 
> "System type" line of the System Info page. To reach this page, try one of these methods:

* Press the Windows key and Pause/Break key at the same time
* Open your Control Panel from the Windows menu, then navigate to System & Security, then 
System
* Press the Windows button, then navigate to Settings > System > About

You can download Python for Windows from the website 
[https://www.python.org/downloads/windows/](https://www.python.org/downloads/windows/). Click on the "Latest Python 3 Release - Python x.x.x" 
link. If your computer is running a **64-bit** version of Windows, download the **Windows x86-64 
executable installer**. Otherwise, download the **Windows x86 executable installer**. After 
downloading the installer, you should run it (double-click on it) and follow the instructions there.

One thing to watch out for: During the installation, you will notice a window marked "Setup". Make 
sure you tick the "Add Python 3.6 to PATH" or 'Add Python to your environment variables" checkbox 
and click on "Install Now", as shown here (it may look a bit different if you are installing a different 
version):

![](images/Windows-Installation.png)

When the installation completes, you may see a dialog box with a link you can follow to learn more about Python or about the version you installed. Close or cancel that dialog -- you'll be learning more in this tutorial!

### Install Python: OS X

> NOTE: If you have a different version of Python installed, at least 3.4 or greater, then you don't have to 
upgrade.  To check if you have it installed (and which version it is), open a console and type the following command:

```bash
$ python3 --version
Python 3.6.3
```

If you don't have Python installed, or if you want a newer version, you can install it as 
follows:

```bash
brew install python3
```


### Install Python: Linux

It is very likely that you already have Python installed out of the box. To check if you have it installed 
(and which version it is), open a console and type the following command:

```bash
$ python3 --version
Python 3.6.3
```

If you have a different version of Python installed, at least 3.4.0 (e.g. 3.6.0), then you don't have to 
upgrade. If you don't have Python installed, or if you want a newer version, you can install it as 
follows:

### Install Python: Debian or Ubuntu

Type this command into your console

```bash
$ sudo apt install python3
```

### Install Python: Fedora

Use this command in your console:

```bash
sudo dnf install python3
```

If you're on older Fedora versions you might get an error that the command dnf is not found. In that case, 
you need to use yum instead.


> Verify the installation was successful by opening a command prompt and running the `python3` 
command:
```bash
python3 --version 
Python 3.7.3
```