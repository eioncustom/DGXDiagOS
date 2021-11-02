# DGXDiagOS is a nice comprehensive suite of utilities for diagnostics on the Nvidia DGX Platforms.
I have found that since I would have to oversee hundreds of these systems, I was performing a lot of diagnostics. 
In order to speed up the process, I spent the time to develop this menu system for Nvidia Field Diagnostics


inject.sh will inspect the machine for the menu.sh file. This should be ran within the DiagOS Kernel.
inject.sh that can be appedned to /var/diags/.bashrc that will check for the menu system and if it isn't found, it will install it from a given location.

The menu.sh script will look for the field diagnostics for a DGX-2 (I have not been able to test it on a DGX-1, DGX-2H or the DGX-A100. 
This script is well tested on the standard DGX-2, under the 629-FLD03-2987-510 Diagnostics Package.
