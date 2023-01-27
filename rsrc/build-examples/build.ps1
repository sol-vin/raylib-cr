param ($name, $debug=0)

$env:LIB = "${env:LIB};C:\raylib\lib"
$env:PATH = "${env:PATH};C:\raylib\lib"

Set-Location -Path "..\..\examples"

Remove-Item "_build" -Force
mkdir _build
mkdir _build\rsrc

Copy-Item -Path "..\rsrc\native\windows\raylib\lib\raylib.dll" -Destination "_build"

function Build-Example {
  param(
    [Parameter()]
    [string] $Name,

    [Parameter()]
    [int] $BuildType
  )

  Set-Location -Path $Name
  Copy-Item -Path "rsrc\*" -Destination "..\_build\rsrc" -Recurse -Force
  Remove-Item "lib" -Recurse -Force
  mkdir lib
  mkdir lib\raylib-cr
  Copy-Item -Path (Get-Item -Path "..\..\*" -Exclude ('examples')).FullName -Destination "lib/raylib-cr" -Recurse -Force
  if ($BuildType -eq 1) {
    $build = "debug"
  }
  else {
    $build = "release"
  }
  crystal build --$build -s -p -t -o ..\_build\$Name.exe .\src\$Name.cr
  Set-Location -Path ".."
}
 
if ($name -eq $null) {
  Build-Example -Name "fogshader" -Debug $debug
  Build-Example -Name "collisionarea" -Debug $debug
  Build-Example -Name "rlgl_solar_system" -Debug $debug
  Build-Example -Name "shapes" -Debug $debug
  Build-Example -Name "shapes_top_down_lights" -Debug $debug
  Build-Example -Name "smooth_pixel_perfect_camera" -Debug $debug
  Build-Example -Name "three_d_camera_mode" -Debug $debug
  Build-Example -Name "sound_test" -Debug $debug
}
else {
  Build-Example -Name $name -Debug $debug
}
Set-Location -Path "_build"
del *.pdb
Set-Location -Path "..\..\rsrc\build-examples"



