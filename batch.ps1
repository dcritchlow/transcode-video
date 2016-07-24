#requires -version 4

<#
.SYNOPSIS
  Batch execution for transcoding video .mkv files to .mp4 for plex server
.DESCRIPTION
  Powershell script that works with .mkv video files and transcodes them to .mp4 for plex servers
.PARAMETER DeleteFile
  Optional. When parameter specified it will remove the original video file(s)
.INPUTS
  Parameters above
.OUTPUTS
  None
.NOTES
  Version:        1.0
  Author:         Darin Critchlow
  Creation Date:  07/20/2016
  Purpose/Change: Initial script development
.EXAMPLE
  ./batch.ps1

  Starts processing video(s) listed in the queue.txt file and creates a new .mp4 video file in the completed directory inside a new
  directory with the same name that is in queue.txt file.

.EXAMPLE
  ./batch.ps1 -DeleteFile
  
  Starts processing video(s) listed in the queue.txt file and creates a new .mp4 video file in the completed directory inside a new
  directory with the same name that is in queue.txt file and removes original .mkv video file.

.LINK
  https://github.com/dcritchlow/transcode-video

#>

#---------------------------------------------------------[Script Parameters]------------------------------------------------------

Param (
  [Parameter(Mandatory=$false,Position=0)][switch]$DeleteFile
)

#---------------------------------------------------------[Initialisations]--------------------------------------------------------

#Set Error Action to Silently Continue
$ErrorActionPreference = 'SilentlyContinue'

#Import Modules & Snap-ins

#----------------------------------------------------------[Declarations]----------------------------------------------------------

#Global Declarations
$currDir = Get-Location
$completed = "$currDir\Completed"
$queue = "$currDir\queue.txt"
$crops = "$currDir\Crops"
$logs = "$currDir\TranscodeLogs"
$videoLocation = "$currDir\Videos"

#-----------------------------------------------------------[Functions]------------------------------------------------------------

Function Start-VideoProcess {
  Param ([string[]] $lines)
  Begin {
    Write-Host 'Processing the next movie in queue...'
  }
  Process {
    Try {

        $lines = Get-VideoQueue
        
        foreach($line in $lines) {

            $video = "$videoLocation\$line\$line.mkv"
            Write-Host $video

            $cropOption = Get-CropFile($line)

            # Create Directory for movie file
            Add-MovieDirectory($line)
            
            # Build Command
            $command = "transcode-video.bat --mp4 -o ""$completed\$line\$line.mp4"" $cropOption ""$video"""

            # Run command
            iex "&$command"

            # Move log file to logs directory
            mv "$completed\$line\$line.mp4.log" $logs

            #Deletes original .mkv file
            If ( $DeleteFile -eq $True ) {
                Remove-Item $video
            }
        }

        # Remove line(s) from queue.txt file
        Clear-QueueFile

    }
    Catch {
      Write-Host -BackgroundColor Red "Error: $($_.Exception)"
      Break
    }
  }
  End {
    If ($?) {
      Write-Host 'Completed video transcoding.'
      Write-Host ' '
    }
  }
}

Function Get-VideoQueue {
  Param ()
  Begin {
    Write-Host 'Getting the list of movies to process...'
  }
  Process {
    Try {
      $lines = Get-Content $queue
    }
    Catch {
      Write-Host -BackgroundColor Red "Error: $($_.Exception)"
      Break
    }
  }
  End {
    If ($?) {
      Write-Host 'Completed getting video queue.'
      Write-Host ' '
      Return $lines
    }
  }
}

Function Get-CropFile {
  Param ([String] $line)
  Begin {
    Write-Host 'Checking for a Crop file for video...'
  }
  Process {
    Try {
        $cropFile = "$crops\$line.txt"
        if(Test-Path $cropFile){
            Write-Host 'Found a crop file setting value for command...'
            $cropValue = Get-Content $cropFile
            $cropOption = "--crop $cropValue"
        } else {
            Write-Host 'No crop file found...'
            $cropOption = ''
        }
    }
    Catch {
      Write-Host -BackgroundColor Red "Error: $($_.Exception)"
      Break
    }
  }
  End {
    If ($?) {
      Write-Host 'Completed getting crop file.'
      Write-Host ' '
      Return $cropOption
    }
  }
}


Function Add-MovieDirectory {
  Param ([String] $line)
  Begin {
    Write-Host 'Creating directory to hold video file...'
  }
  Process {
    Try {
      ni "$completed\$line" -type Directory
    }
    Catch {
      Write-Host -BackgroundColor Red "Error: $($_.Exception)"
      Break
    }
  }
  End {
    If ($?) {
      Write-Host 'Created Directory.'
      Write-Host ' '
    }
  }
}

Function Clear-QueueFile {
  Param ()
  Begin {
    Write-Host 'Clearing queue.txt file...'
  }
  Process {
    Try {
      Out-File $queue -Force
    }
    Catch {
      Write-Host -BackgroundColor Red "Error: $($_.Exception)"
      Break
    }
  }
  End {
    If ($?) {
      Write-Host 'File is empty.'
      Write-Host ' '
    }
  }
}

#-----------------------------------------------------------[Execution]------------------------------------------------------------

Start-VideoProcess