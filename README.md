# FriendlyPackage
Package for restarting and opening Apps based on EvilWorkspace by @seanistethered

# Disclaimer
I have NOT found any Exploits used by this package, all credit goes to @seanistethered and their Project https://github.com/seanistethered/EvilWorkspace


This package removes the "evilness" of EvilWorkspace and turns it into a package with two useful features for App Developers, this exploit might soon be fixed though so all Issues created when the exploit breaks will be ignored, please also don't harass the original creator.

# Features
This package includes two functions:

## restartApp()
Restarts the App

## openApp(_ bundleID: String)
Open's the App with the specified Bundle ID

And one function you have to use once (on App Start for Example) to initialize it:
## initializeFriendlyService() 
Uses EvilFind() to set the WorkSpace
