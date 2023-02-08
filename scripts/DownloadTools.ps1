#Nodejs
$target_url = "https://nodejs.org/dist/v18.13.0/node-v18.13.0-x64.msi"
$file_path1 = "D:/node-v18.13.0-x64.msi"
Write-Output "[1/4] Downloading Node.js v18.13.0"
Invoke-WebRequest $target_url -OutFile $file_path1
Write-Output "Download is complete!"

#VSCode
$target_url = "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user"
$file_path2 = "D:/VSCodeUserSetup-x64.exe"
Write-Output "[2/4] Downloading VSCode x64"
Invoke-WebRequest $target_url -OutFile $file_path2
Write-Output "Download is complete!"

#Azure Functions Core Tools v4
$target_url = "https://go.microsoft.com/fwlink/?linkid=2174087"
$file_path3 = "D:/func-cli-x64.msi"
Write-Output "[3/4] Downloading Azure Functions Core Tools v4"
Invoke-WebRequest $target_url -OutFile $file_path3
Write-Output "Download is complete!"

#Git for Windows
$target_url = "https://github.com/git-for-windows/git/releases/download/v2.39.1.windows.1/Git-2.39.1-64-bit.exe"
$file_path4 = "D:/Git-2.39.1-64-bit.exe"
Write-Output "[4/4] Downloading Git for Windows"
Invoke-WebRequest $target_url -OutFile $file_path4
Write-Output "Download is complete!`n"

Write-Output "[1/4] Installing Node.js"
Start-Process -FilePath $file_path1 -Wait
Write-Output "[2/4] Installing VSCode x64"
Start-Process -FilePath $file_path2 -Wait
Write-Output "[3/4] Installing Azure Functions Core Tools v4"
Start-Process -FilePath $file_path3 -Wait
Write-Output "[4/4] Installing Git for Windows"
Start-Process -FilePath $file_path4 -Wait


pause