$currDir = Get-Location
$completed = "$currDir\Completed"
$queue = "$currDir\queue.txt"
$crops = "$currDir\Crops"
$logs = "$completed\Logs"
$videoLocation = "C:\Video"

$lines = Get-Content $queue
Write-Host $lines

foreach($line in $lines){

    $video = "$videoLocation\$line\$line.mkv"

    $cropFile = "$crops\$fileName.txt"
    if(Test-Path $cropFile){
        $cropValue = Get-Content $cropFile
        $crop_option = "--crop $cropValue"
    } else {
        $crop_option = ''
    }

    # Create Directory for movie file
    ni "$completed\$line" -type Directory
    
    # Build Command
    $command = "transcode-video.bat --mp4 -o ""$completed\$line\$line.mp4"" $crop_option ""$video"""
    
    
    # Run command
    iex "&$command"

    # Move log file to logs directory
    mv "$completed\$line\$line.mp4.log" $logs

    # This removes actual file
    # Remove-Item $line
}

# Remove line(s) from queue.txt file
Out-File $queue -Force
