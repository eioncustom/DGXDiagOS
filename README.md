# DGXDiagOS is a nice comprehensive suite of utilities for diagnostics on the Nvidia DGX Platforms. However it is not intuitive and will take some training time for those unfamiliar with the suite.


I have found that since I would have to oversee hundreds of these systems, I was performing a lot of diagnostics. Then when I brought on new people to my team and the continous rotation of team members, I spent a lot of time training and point people to my tutorials.
# In order to speed up the process, I spent the time to develop this menu system for Nvidia Field Diagnostics

# inject.sh 
This will inspect the machine for the menu.sh file. This should be ran within the DiagOS Kernel.
inject.sh can also be appedned to /var/diags/.bashrc from the DGX-OS Kernel. Then the next user to "sudo bash" in the Diagnostic Kernel, it will check and install the menu.

# inject_v2.sh
This is very similar to inject.sh but with logic.
It pulls and compares the local copy and a pulled copy from a FTP server. If they are different or the local copy isn't present it will update the machine accordingly.

# menu.sh
This script will look for the field diagnostics for a DGX-2 (I have not been able to test it on a DGX-1, DGX-2H or the DGX-A100). 
The script can easily be adapted for the Nvidia DGX SKUs.

Updated to add parameters to the cli invocation. All menu items are currently supported.

# flog_collect.sh
This script will package all the previous Field Diagnostic Logs and upload the to your favorite FTP Server.
It is really handy when the system crashes during testing and no logs were uploaded with the main.sh script.
