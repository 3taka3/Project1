#Avoir PowerShell / Oracle Virtual Box + C++ 2019

#variables
$vmName = "MaVM1"
$vmOS = "Debian" # Le nom de l'OS que vous utilisez (par exemple, "Ubuntu")
$isoPath = "C:\Users\User\Desktop\debian-12.2.0-amd64-netinst.iso" # Le chemin vers l'ISO Linux
$memory = 2048 # Mémoire en Mo
$cpuCount = 2 # Nombre de cœurs de CPU
$diskSize = 20000 # Taille du disque en Mo

#creation VM
New-VM -Name $vmName -OSType $vmOS 

#configuration VM
Set-VMMemory -VMName $vmName -MemorySizeMB $memory 
Set-VMProcessor -VMName $vmName -Count $cpuCount

#ajout lecteur de disque optique pour le système d'exploitation
Add-VMDvdDrive -VMName $vmName
Set-VMDvdDrive -VMName $vmName -Path $isoPath

#Creation disque dur virtuel 
New-VHD -Path "C:\Users\User\Desktop\$vmName.vdi" -SizeBytes $diskSize

Start-VM -Name $vmName