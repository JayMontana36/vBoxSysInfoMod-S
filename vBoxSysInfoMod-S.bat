@echo off
:_PreInit
title vBoxSysInfoMod by JayMontana36 - Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License
echo.
echo.
echo Hello %username% and %computername%, I am vBoxSysInfoMod (also known as VirtualBox VM System Information Modifier),
echo and I am both originally created and maintained by JayMontana36. Also, just as an additional and preemptive heads up:
echo.
echo.
echo This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
echo To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/ or
echo send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
echo.
echo.
echo One final note, I am donationware; if you find and/or consider me to be useful, please consider donating to JayMontana36
echo to help support further development (updates, functionality and features). See "Donate" for more information; thanks.
echo.
echo.
pause

:_Init
set _title=vBoxSysInfoMod - VirtualBox VM System Information Modifier S v1 by JayMontana36
title %_title%
set vBoxInstallLocation=%VBOX_MSI_INSTALL_PATH%
echo Starting %_title%...
IF NOT EXIST "%vBoxInstallLocation%" (goto _vBoxLocateFailed) else IF NOT EXIST "%vBoxInstallLocation%\VBoxManage.exe" (goto _vBoxLocateFailed) else set vBox="%vBoxInstallLocation%\VBoxManage.exe"

:_vmListAndSelect
cls
echo %title%
echo.
echo A list of all available VirtualBox VMs:
%vBox% list vms
echo.
set /p VMname="VM to modify: "
for /f "tokens=1 delims=firmware=" %%F in ('"%vBox% showvminfo "%VMname%" --machinereadable | findstr firmware"') do set _vmMode=%%~F
IF [%_vmMode%] EQU [BIOS] (set fw=pcbios) else IF [%_vmMode%] EQU [EFI] (set fw=efi) else (goto vmListAndSelect)

:_ModifyVM
cls
echo %title%
echo.
echo DMI BIOS information (type 0)
echo.
echo.
@REM DMI BIOS information (type 0)
set /p DmiBIOSVendor="BIOS Vendor: "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiBIOSVendor" "%DmiBIOSVendor%"
set /p DmiBIOSVersion="BIOS Version: "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiBIOSVersion" "%DmiBIOSVersion%"
set /p DmiBIOSReleaseDate="BIOS Release Date: "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiBIOSReleaseDate" "%DmiBIOSReleaseDate%"
set /p DmiBIOSReleaseMajor="BIOS Release Major: "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiBIOSReleaseMajor" "%DmiBIOSReleaseMajor%"
set /p DmiBIOSReleaseMinor="BIOS Release Minor: "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiBIOSReleaseMinor" "%DmiBIOSReleaseMinor%"
set /p DmiBIOSFirmwareMajor="BIOS Firmware Major: "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiBIOSFirmwareMajor" "%DmiBIOSFirmwareMajor%"
set /p DmiBIOSFirmwareMinor="BIOS Firmware Minor: "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiBIOSFirmwareMinor" "%DmiBIOSFirmwareMinor%"

cls
echo %title%
echo.
echo DMI system information (type 1)
echo.
@REM DMI system information (type 1)
set /p DmiSystemVendor="System Vendor: "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiSystemVendor" "%DmiSystemVendor%"
set /p DmiSystemProduct="System Product: "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiSystemProduct" "%DmiSystemProduct%"
set /p DmiSystemVersion="System Version: "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiSystemVersion" "%DmiSystemVersion%"
set /p DmiSystemSerial="System Serial: "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiSystemSerial" "%DmiSystemSerial%"
set /p DmiSystemSKU="System SKU: "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiSystemSKU" "%DmiSystemSKU%"
set /p DmiSystemFamily="System Family: "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiSystemFamily" "%DmiSystemFamily%"
set /p DmiSystemUuid="System UUID: "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiSystemUuid" "%DmiSystemUuid%"

cls
echo %title%
echo.
echo DMI board information (type 2)
echo.
@REM DMI board information (type 2)
set /p DmiBoardVendor="Board Vendor: "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiBoardVendor" "%DmiBoardVendor%"
set /p DmiBoardProduct="Board Product: "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiBoardProduct" "%DmiBoardProduct%"
set /p DmiBoardVersion="Board Version: "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiBoardVersion" "%DmiBoardVersion%"
set /p DmiBoardSerial="Board Serial: "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiBoardSerial" "%DmiBoardSerial%"
set /p DmiBoardAssetTag="Board Tag: "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiBoardAssetTag" "%DmiBoardAssetTag%"
set /p DmiBoardLocInChass="Board Location: "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiBoardLocInChass" "%DmiBoardLocInChass%"
set /p DmiBoardBoardType="Board Board Type: "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiBoardBoardType" "%DmiBoardBoardType% (10)"

cls
echo %title%
echo.
echo DMI system enclosure or chassis (type 3)
echo.
@REM DMI system enclosure or chassis (type 3)
set /p DmiChassisVendor="Chassis Vendor: "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiChassisVendor"     "%DmiChassisVendor%"
set /p DmiChassisType="Chassis Type: "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiChassisType"       "%DmiChassisType% (3)"
set /p DmiChassisVersion="Chassis Version: "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiChassisVersion"    "%DmiChassisVersion%"
set /p DmiChassisSerial="Chassis Serial: "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiChassisSerial"     "%DmiChassisSerial%"
set /p DmiChassisAssetTag="Chassis Tag: "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiChassisAssetTag"   "%DmiChassisAssetTag%"

cls
echo %title%
echo.
echo DMI processor information (type 4)
echo.
@REM DMI processor information (type 4)
set /p DmiProcManufacturer="Processor Manufacturer (Example: GenuineIntel): "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiProcManufacturer"  "%DmiProcManufacturer%"
set /p DmiProcVersion="Processor Version (Example: Pentium(R) III): "
%vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiProcVersion"       "%DmiProcVersion%"

@REM cls
@REM echo %title%
@REM echo.
@REM echo DMI OEM strings (type 11)
@REM echo.

@REM @REM DMI OEM strings (type 11)
@REM %vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiOEMVBoxVer" "vboxVer_1.2.3"
@REM %vBox% setextradata "%VMname%" "VBoxInternal/Devices/%fw%/0/Config/DmiOEMVBoxRev" "vboxRev_12345"

@REM cls
@REM echo %title%
@REM echo.
@REM echo Hard Disk Vendor Product Data (VPD)
@REM echo.

@REM @REM Hard Disk Vendor Product Data (VPD)
@REM %vBox% setextradata "%VMname%" "VBoxInternal/Devices/ahci/0/Config/Port0/SerialNumber" "serial"
@REM %vBox% setextradata "%VMname%" "VBoxInternal/Devices/ahci/0/Config/Port0/FirmwareRevision" "firmware"
@REM %vBox% setextradata "%VMname%" "VBoxInternal/Devices/ahci/0/Config/Port0/ModelNumber" "model"

@REM @REM The above commands apply to virtual machines with an AHCI (SATA) controller. The commands for virtual machines with an IDE controller are:
@REM %vBox% setextradata "%VMname%" "VBoxInternal/Devices/piix3ide/0/Config/PrimaryMaster/SerialNumber" "serial"
@REM %vBox% setextradata "%VMname%" "VBoxInternal/Devices/piix3ide/0/Config/PrimaryMaster/FirmwareRevision" "firmware"
@REM %vBox% setextradata "%VMname%" "VBoxInternal/Devices/piix3ide/0/Config/PrimaryMaster/ModelNumber" "model"

@REM @REM For hard disks it's also possible to mark the drive as having a non-rotational medium with:
@REM %vBox% setextradata "%VMname%" "VBoxInternal/Devices/ahci/0/Config/Port0/NonRotational" "1"

@REM @REM Additional three parameters are needed for CD/DVD drives to report the vendor product data:
@REM %vBox% setextradata "%VMname%" "VBoxInternal/Devices/ahci/0/Config/Port0/ATAPIVendorId" "vendor"
@REM %vBox% setextradata "%VMname%" "VBoxInternal/Devices/ahci/0/Config/Port0/ATAPIProductId" "product"
@REM %vBox% setextradata "%VMname%" "VBoxInternal/Devices/ahci/0/Config/Port0/ATAPIRevision" "revision"

@REM cls
@REM echo %title%
@REM echo.
@REM echo Custom VESA Resolutions
@REM echo.

@REM @REM Custom VESA Resolutions
@REM %vBox% setextradata "%VMname%" "CustomVideoMode1" "1920x1080x16"
goto credits

:_vBoxLocateFailed
cls
echo Failed to start %_title%:
echo.
echo VirtualBox was not found in directory "%vBoxInstallLocation%"
echo.
set /p vBoxInstallLocation="Please provide the location of your current VirtualBox Installation: "
goto _Init

:credits
cls
echo %_title%
echo.
echo.
echo.
echo vBoxSysInfoMod - VirtualBox VM System Information Modifier was originally created and maintained by JayMontana36.
echo.
echo.
echo.
echo.
echo Discord: https://discord.gg/23SckZN - You'll be able to communicate and interact more with me directly in realtime or
echo together as a community; you'll also be able to see and/or hear about new things (features/functionalities) before
echo they even become a thing or as they're becoming things, and you'll be able to more directly influence what additions
echo and improvements I make by directly giving me feedback and suggestions as well as more directly reporting bugs to me.
echo There will be sections for scambaiting, gaming, tech, tutorials, software, as well as anything else you might request.
echo.
echo.
echo.
echo.
echo YouTube: https://www.youtube.com/channel/UCq-L3aIwJD3tCpMEawdgW7Q - Subscribe if you'd like to support my channel, I
echo will be uploading more and/or new tutorials from time to time as well as some other tech related content in the future.
echo JM36's Tech TV - https://goo.gl/QiKWrj
echo.
echo.
echo.
echo.
echo Official Website: https://sites.google.com/site/jaymontana36jasen - Bookmark my website for easy access if you'd like,
echo as I may add to it in the future with other scripts, content, programs/software, etc. Site - https://goo.gl/3SCLQN
echo.
echo.
echo.
echo.
echo "ModifyVM", "ResetVM", "Credits", "Discord", "YouTube", "YT", "Site", "Exit"
echo.
set /p endsel="%username%@%computername%>"
IF /I [%endsel%] EQU [ModifyVM] (set pinitsel=ModifyVM) else IF /I [%endsel%] EQU [ResetVM] (set pinitsel=ResetVM) else IF /I [%endsel%] EQU [Modify] (set pinitsel=ModifyVM) else IF /I [%endsel%] EQU [Reset] (set pinitsel=ResetVM) else IF /I [%endsel%] EQU [Mod] (set pinitsel=ModifyVM) else IF /I [%endsel%] EQU [M] (set pinitsel=ModifyVM) else IF /I [%endsel%] EQU [R] (set pinitsel=ResetVM)
IF /I [%pinitsel%] EQU [ModifyVM] (set _pinitsel=modify) else IF /I [%pinitsel%] EQU [ResetVM] (set _pinitsel=reset)
goto %endsel%

:Exit
exit

:Site
start https://sites.google.com/site/jaymontana36jasen
goto credits

:YT
:YouTube
start https://www.youtube.com/channel/UCq-L3aIwJD3tCpMEawdgW7Q
goto credits

:Discord
start https://discord.gg/23SckZN
goto credits

:License
echo This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
echo To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/ or
echo send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
pause
goto credits

:Debug
echo Heads up! Reminder:
echo This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
echo To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/ or
echo send a letter to Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
pause
start http://creativecommons.org/licenses/by-nc-sa/4.0/
pause
@echo on
goto _Init
