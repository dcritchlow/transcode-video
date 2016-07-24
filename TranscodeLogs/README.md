This is where the logs from transcoding the videos will be. These logs are created from handbrake and can give useful information. Go to this [link](https://github.com/donmelton/video_transcoding#using-query-handbrake-log) for the list of commands available and descriptions.

Example output:
```
PS C:\<Your folder>\transcode-video> query-handbrake-log.bat time .\TranscodeLogs\
00:14:30 Stitch! The Movie (Video 2003).mp4
00:22:01 Cinderella (1950).mp4
00:24:17 Pocahontas (1995).mp4
00:30:10 Shark Tale (2004).mp4
PS C:\<Your folder>\transcode-video> query-handbrake-log.bat bitrate .\TranscodeLogs\
1736.64 kbps Stitch! The Movie (Video 2003).mp4
1770.21 kbps Cinderella (1950).mp4
1786.51 kbps Pocahontas (1995).mp4
1876.04 kbps Shark Tale (2004).mp4
PS C:\<Your folder>\transcode-video> query-handbrake-log.bat ratefactor .\TranscodeLogs\
13.68 Stitch! The Movie (Video 2003).mp4
15.13 Pocahontas (1995).mp4
15.47 Cinderella (1950).mp4
19.13 Shark Tale (2004).mp4
PS C:\<Your folder>\transcode-video> query-handbrake-log.bat speed .\TranscodeLogs\
99.774437 fps Stitch! The Movie (Video 2003).mp4
83.187912 fps Pocahontas (1995).mp4
81.730949 fps Cinderella (1950).mp4
71.326317 fps Shark Tale (2004).mp4
```