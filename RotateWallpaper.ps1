# Get root path of script
$PSScriptRoot = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition;
$path=$PSScriptRoot + "\images\";
write-output ("Image Path: " + $path);

# Get UTC Time + 12 hours
$utc = (get-date).ToUniversalTime().AddHours(12);

# Get elapsed seconds since last hour started
$elapsed = $utc.Minute * 60 + $utc.Second;

# choose right minute parameter based on elapsed seconds 
if ($elapsed -lt 450){ $m = "00";} # < 7.5 min
elseif ($elapsed -lt 1350){ $m = "15";} # < 22.5 min
elseif ($elapsed -lt 2250){ $m = "30";} # < 37.5 min
elseif ($elapsed -lt 3150){ $m = "45";} # < 52.5 min
else { $m = "00"; $utc = $utc.AddHours(1);} # > 52.5 min

# Create filename (for example 12h15m.jpg)
$file=($utc).ToString("HH") + "h" + $m + "m.jpg";

# Set Wallpaper
write-output ("Set wallpaper to: " + $file);
Copy-Item (Convert-Path ($path + $file)) -destination ($path + "wallpaper.jpg") -force
