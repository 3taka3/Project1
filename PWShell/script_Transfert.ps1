#Transfert de contenu d'un point a à b
$source = "C:\Users\User\Desktop\PWShell"
$destination = "C:\Users\User\Documents\Scripts\PowerShell"

Get-ChildItem $source | Copy-Item -Destination $destination

Write-Host "La sauvegarde a ete realisee avec suxes"