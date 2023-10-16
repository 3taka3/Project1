#Avoir PowerShell / VmWare Workstation

# Créez une nouvelle instance de l'objet VMware Workstation
$vmware = New-Object -ComObject "VMware.VMwareWorkstation"

# Définissez les chemins et les noms de fichiers
$vmxFilePath = "C:\Users\User\Desktop\VM1.vmx"
$isoFilePath = "C:\Users\User\Desktop\debian-12.2.0-amd64-netinst.iso"

# Créez une nouvelle VM
$vm = $vmware.CreateVM($vmxFilePath)

# Configurez les propriétés de la VM
$vm.GuestOS = "Debian"
$vm.MemorySize = 2048  # Mémoire en Mo
$vm.NumProcessors = 2  # Nombre de processeurs

# Ajoutez un lecteur CD-ROM
$cdrom = $vm.CDROMDrives.Add
$cdrom.HostDrive = $isoFilePath
$cdrom.StartConnected = $true

# Enregistrez la configuration
$vm.Save

# Démarrer la VM
$vm.PowerOn