function copy_to_config {
    param(
        [Parameter(Mandatory=$true)]
        [string]$file,
        
        [Parameter(Mandatory=$true)]
        [string]$destination
    )
    
    # Check if source file exists
    if (-not (Test-Path $file -PathType Leaf)) {
        Write-Error "Source file does not exist: $file"
        return
    }
    
    # Check if destination directory exists, create if it doesn't
    if (-not (Test-Path $destination -PathType Container)) {
        try {
            New-Item -ItemType Directory -Path $destination -Force | Out-Null
            Write-Host "Created destination directory: $destination" -ForegroundColor Green
        }
        catch {
            Write-Error "Failed to create destination directory: $destination"
            return
        }
    }
    
    # Get the filename from the source path
    $fileName = Split-Path $file -Leaf
    $destinationPath = Join-Path $destination $fileName
    
    # Check if destination file already exists
    if (Test-Path $destinationPath -PathType Leaf) {
        do {
            $response = Read-Host "File '$fileName' already exists in '$destination'. Do you want to overwrite it? (y/n)"
            $response = $response.ToLower()
        } while ($response -ne 'y' -and $response -ne 'n' -and $response -ne 'yes' -and $response -ne 'no')
        
        if ($response -eq 'n' -or $response -eq 'no') {
            Write-Host "Copy operation cancelled by user." -ForegroundColor Yellow
            return
        }
    }
    
    # Copy the file
    try {
        Copy-Item $file $destinationPath -Force
        Write-Host "Successfully copied '$fileName' to '$destination'" -ForegroundColor Green
    }
    catch {
        Write-Error "Failed to copy file: $($_.Exception.Message)"
    }
}
