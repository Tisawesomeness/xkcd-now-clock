# xkcd-now-clock
Sometimes you are forced to use a M$-System. Wouldn't it be cool to have a nice Wallpaper?
Well with the scripts found in this repository you can use the [XKCD Now Comic](http://xkcd.com/now/) as your Wallpaper.

## Installation

1. Download or clone this repository
2. Run the `install.bat` (See below for customization)
   * **Note**: If you recieve an Error when the `install.bat` finished, you have to open an cmd as Administrator and run: `powershell Set-ExecutionPolicy Unrestricted`
3. Import the created `XKCD-Now-Clock.xml` with the Windows Task Scheduler
4. Set the Dexpot background to wallpaper.jpg in the images foler
5. Now you have a nice Wallpaper clock

## How it works.
The `install.bat` downloads all pictures of the Comic and converts them to jpg, as Windows just supports JPEG-Wallpapers.
Once you imported the `XKCD-Now-Clock.xml` a Task will be created which runs every 15 min and changes the wallpaper.
The Task executes the `invis.vbs` which allows to call the powershell script `RotateWallpaper.ps1` invisibly.
The `RotateWallpaper.ps1` determines which Image should be used and changes the wallpaper to it.

## Customization
The `install.bat` allows the following parameters.
* `download`: Images will be re-downloaded from the xkcd servers
* `convert`: Images will be converted again to jpg.
   * Optionally you can specify `label`, which will add your local time and UTC time in the bottom right corner.
   * Without any further specified options you will get the raw images.
     The output for `install.bat convert`:  
     ![normal](https://raw.github.com/leipert/xkcd-now-clock/master/doc/normal.gif)
   * With `clock` specified, a little red dot will be added to the picitures, showing your local time.  
     Additionally you can specify `ampm`, so that the dot will behave 12-hour-like instead of 24-hour-like.  
     The output for `install.bat convert clock label`:  
     ![clock](https://raw.github.com/leipert/xkcd-now-clock/master/doc/clock.gif)
   * With `center` specified, your time-zone will always be at the 12 'o clock position of the image.  
     The output for `install.bat convert center`:  
     ![center](https://raw.github.com/leipert/xkcd-now-clock/master/doc/center.gif)
