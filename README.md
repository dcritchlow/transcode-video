# My scripts to transcode my videos
This uses the ruby scripts from this GitHub [project](https://github.com/donmelton/video_transcoding).

## Install Ruby Windows
First install ruby from [RubyInstaller](http://rubyinstaller.org/).

## Install HandBrake CLI (Command Line Interface)
Go to [downloads](https://handbrake.fr/downloads2.php) and download the appropriate file for your machine and install.

## Install Ruby gem
```gem install video_transcoding```

I use [MakeMKV](http://makemkv.com/) to save the video file containing the feature film and save it to the Videos directory. For the name of the video file I use a quick google search to imdb, Deadpool imdb, for the name of the movie and the year eg. Deadpool (2016) and I change the MakeMKV default from Title00 to Deadpool (2016). I then put Deadpool (2016) in the queue.txt file for the batch processing script to use.

# Here is the display from ```Get-Help -Full .\batch.ps1``` in PowerShell:
```
NAME
    C:\<Your Directory>\batch.ps1

SYNOPSIS
    Batch execution for transcoding video .mkv files to .mp4 for plex server


SYNTAX
    C:\<Your Directory>\batch.ps1 [[-DeleteFile]] [<CommonParameters>]


DESCRIPTION
    Powershell script that works with .mkv video files and transcodes them to .mp4 for plex servers


RELATED LINKS

REMARKS
    To see the examples, type: "get-help C:\<Your Directory>\batch.ps1 -examples".
    For more information, type: "get-help C:\<Your Directory>\batch.ps1 -detailed".
    For technical information, type: "get-help C:\<Your Directory>\batch.ps1 -full".



PS C:\<Your Directory>> Get-Help -Full .\batch.ps1

NAME
    C:\<Your Directory>\batch.ps1

SYNOPSIS
    Batch execution for transcoding video .mkv files to .mp4 for plex server

SYNTAX
    C:\<Your Directory>\batch.ps1 [[-DeleteFile]] [<CommonParameters>]


DESCRIPTION
    Powershell script that works with .mkv video files and transcodes them to .mp4 for plex servers


PARAMETERS
    -DeleteFile [<SwitchParameter>]
        Optional. When parameter specified it will remove the original video file(s)

        Required?                    false
        Position?                    1
        Default value                False
        Accept pipeline input?       false
        Accept wildcard characters?  false

    <CommonParameters>
        This cmdlet supports the common parameters: Verbose, Debug,
        ErrorAction, ErrorVariable, WarningAction, WarningVariable,
        OutBuffer, PipelineVariable, and OutVariable. For more information, see
        about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

INPUTS
    Parameters above




OUTPUTS
    None




NOTES


        Version:        1.0
        Author:         Darin Critchlow
        Creation Date:  07/20/2016
        Purpose/Change: Initial script development

    -------------------------- EXAMPLE 1 --------------------------

    PS C:\>./batch.ps1


    Starts processing video(s) listed in the queue.txt file and creates a new .mp4 video file in the completed
    directory inside a new
    directory with the same name that is in queue.txt file.





    -------------------------- EXAMPLE 2 --------------------------

    PS C:\>./batch.ps1 -DeleteFile


    Starts processing video(s) listed in the queue.txt file and creates a new .mp4 video file in the completed
    directory inside a new
    directory with the same name that is in queue.txt file and removes original .mkv video file.


RELATED LINKS
    https://github.com/dcritchlow/transcode-video
```