This folder should hold the crop values from ```detect-crop.bat <Video.mkv file>```. That command will return something like ```transcode-video --crop 0:0:16:14 .\\Videos\\Pocahontas\ \(1995\)\\Pocahontas\ \(1995\).mkv```. Make sure that you only put this ```0:0:16:14``` in a file named the same as the .mkv title.

The folder would look like this with the Pocahontas example above.
```
├───Crops
│       Pocahontas (1995).txt
```
Inside the Pocahontas (1995).txt file you would have ```0:0:16:14``` that the batch script would pass to the transcode-video command to remove the superfluous black around the movie.