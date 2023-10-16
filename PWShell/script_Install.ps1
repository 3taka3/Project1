#téléchargement app automatique
$softwareUrls =@("https://ec.ccm2.net/www.commentcamarche.net/download/files/SteamSetup-1603487799.exe")

$destination = "C:Users\User\Desktop"

#condition si repertoire inexistant
if(!(Test-Path $destination)){

    New-Item -ItemType Directory -Path $destination
}

foreach ($softwareUrl in $softwareUrls){

    #definition du nom de fichier
    $nomFichier =[system.IO.Path]::GetFileName($softwareUrl)

    #invocatio de l'url et definition de sa destination
    Invoke-WebRequest -Uri $softwareUrl -OutFile "$destination\$nomFichier"

    Start-Process "$destination\$nomFichier" -wait
}

Write-Host "L'installation des logiciels ont ete realises avec suxes"