<#
Runs `sudo yum update -y` on all Vagrant VMs (rhel1..rhel6).
Usage (PowerShell):
  powershell -ExecutionPolicy Bypass -File .\scripts\update_all.ps1
Or from PowerShell prompt (in project root):
  .\scripts\update_all.ps1
#>

$vmCount = 6
for ($i = 1; $i -le $vmCount; $i++) {
    $name = "rhel$i"
    Write-Host "---- Updating $name ----"
    & vagrant ssh $name -c "sudo yum update -y"
    if ($LASTEXITCODE -ne 0) {
        Write-Warning "$name update returned exit code $LASTEXITCODE"
    } else {
        Write-Host "$name updated successfully."
    }
}

Write-Host "All done."
