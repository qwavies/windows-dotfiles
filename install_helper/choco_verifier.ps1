function Install-Chocolatey {
    
    # Function to check if running as administrator
    function Test-Administrator {
        $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
        $principal = New-Object Security.Principal.WindowsPrincipal($currentUser)
        return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
    }
    
    # Check if Chocolatey is already installed
    $chocoInstalled = $false
    try {
        $chocoVersion = choco --version 2>$null
        if ($chocoVersion) {
            $chocoInstalled = $true
            Write-Host "Chocolatey is already installed. Version: $chocoVersion" -ForegroundColor Green
        }
    }
    catch {
        $chocoInstalled = $false
    }
    
    # If already installed, exit
    if ($chocoInstalled) {
        return $true
    }
    
    # Check for administrative privileges
    if (-not (Test-Administrator)) {
        Write-Error "Administrator privileges required to install Chocolatey. Please run PowerShell as Administrator."
        return $false
    }
    
    Write-Host "Installing Chocolatey..." -ForegroundColor Cyan
    
    try {
        # Set execution policy temporarily if needed
        $currentPolicy = Get-ExecutionPolicy
        if ($currentPolicy -eq "Restricted") {
            Write-Host "Temporarily setting execution policy to RemoteSigned..." -ForegroundColor Yellow
            Set-ExecutionPolicy RemoteSigned -Scope Process -Force
        }
        
        # Download and install Chocolatey
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
        
        # Refresh environment variables
        $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
        
        # Verify installation
        Start-Sleep -Seconds 2
        $chocoVersion = choco --version 2>$null
        if ($chocoVersion) {
            Write-Host "Chocolatey successfully installed! Version: $chocoVersion" -ForegroundColor Green
            
            # Restore original execution policy if it was changed
            if ($currentPolicy -eq "Restricted") {
                Write-Host "Restoring original execution policy..." -ForegroundColor Yellow
                Set-ExecutionPolicy $currentPolicy -Scope Process -Force
            }
            
            return $true
        }
        else {
            Write-Error "Chocolatey installation failed - unable to verify installation."
            return $false
        }
    }
    catch {
        Write-Error "Failed to install Chocolatey: $($_.Exception.Message)"
        
        # Restore original execution policy if it was changed
        if ($currentPolicy -eq "Restricted") {
            Set-ExecutionPolicy $currentPolicy -Scope Process -Force
        }
        
        return $false
    }
}

# Example usage:
# Install-Chocolatey

# Usage in other scripts:
# if (Install-Chocolatey) {
#     Write-Host "Chocolatey is ready to use!"
#     choco install git -y
# } else {
#     Write-Host "Cannot proceed without Chocolatey"
# }