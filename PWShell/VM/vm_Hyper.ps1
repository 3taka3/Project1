#parametrage Variable VM 
$VMName ='Serv-1'

#Avoir en amont créer un switch external avec Ethernet
$Switch = 'Default Switch' 

$ISO = 'C:\Users\User\Desktop\ISO\debian-12.2.0-amd64-netinst.iso'

#Emplacement machine 
$VHD = 'C:\Users\User\Desktop\Serv\'

$VHDSize = 35GB 
$Ram = 4GB 

#

#Creation Virtual Machine 
New-VM -Name $VMName -MemoryStartupBytes 2GB -Generation 2 -NewVHDPath $VHD"$VMName.vhdx" -NewVHDSizeBytes 40GB -Path $VHD"$VMName" -SwitchName $Switch

# Add Dvd Drive to my VM (installation de l'iso)
Add-VMScsiController -VMName $VMName 
Add-VMDvdDrive -VMName $VMName -ControllerNumber 1 -ControllerLocation 0 -Path $ISO

#Mount Installation Media (comme la gestion du BIOS - demarrage du dvddrive a parametrer sur hyper V)
$DVDDrive = Get-VMDvdDrive -VMName  $VMName
Set-VMfirmware -VMName $VMName -FirstBootDevice $DVDDrive

#Desactiver le secureboot 
Set-VMFirmware -VMName $VMName -EnableSecureBoot Off
 

Start-VM -Name $VMName
vmconnect.exe

