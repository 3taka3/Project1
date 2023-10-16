#suppression de dossier
$deleteDirectories = @(
    "C:\Users\User\Desktop\2delet",  
    "C:\Users\User\Desktop\2delet2",
    "C:\Users\User\Desktop\2delet3"
)
foreach($directory in $deleteDirectories){

    Remove-Item $directory -Recurse -Force
}

Write-Host "Les fichiers temporaires ont bien ete supprime"