# Setup

Follow the instructions provided by SAS.

https://www.sas.com/en_us/software/university-edition/download-software.html

In summary:
- Downloading and installing [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- Downloading the SAS University Edition image (requires a SAS login)
- Import the just downloaded image into VirtualBox
- Configure the `myfolders` directory
    - The documentation at the site above notes the need to create a `SASUniversityEdition` directory; this is not actually needed.  In fact the `myfolders` directory is not needed either.  But to persist code / data on the filesystem, the expectation is that a `myfolders` directory is used.  For more details see the [FAQ](https://support.sas.com/software/products/university-edition/faq/shared_folder_whatis.htm).
- Start up the software from within VirtualBox

<!-- ### SAS Troubleshooting
To get my network adapter working appropriately within VirtualBox, I had to follow the instructions below.

https://support.sas.com/software/products/university-edition/faq/trouble_VPN.htm

I had to navigate to `~/VirtualBox VMs/SAS University Edition` and then submit the following command.
```
VBoxManage modifyvm "SAS University Edition" --natdnshostresolver1 on
```
-->

### VirtualBox Troubleshooting

I had an issue with VirtualBox on macOS where I received the following error &mdash; `Kernel driver not installed`.  The page below helped to fix.

https://www.howtogeek.com/658047/how-to-fix-virtualboxs-%E2%80%9Ckernel-driver-not-installed-rc-1908-error/

