$env:LIB="${env:LIB};C:\raylib\lib"
$env:PATH="${env:PATH};C:\raylib\lib"

Set-Location -Path "..\..\examples"

Remove-Item "_build" -Force
mkdir _build

Copy-Item -Path "..\rsrc\native\windows\raylib\lib\raylib.dll" -Destination "_build"

function Build-Example {
  [CmdletBinding()]
	param(
		[Parameter(Mandatory)]
		[string] $Name
	)


  Set-Location -Path $Name
  Remove-Item "lib" -Recurse -Force
  mkdir lib
  mkdir lib\raylib-cr
  Copy-Item -Path (Get-Item -Path "..\..\*" -Exclude ('examples')).FullName -Destination "lib/raylib-cr" -Recurse -Force
  crystal build --release -o ..\_build\$Name.exe .\src\$Name.cr
  Set-Location -Path ".."
}

Build-Example -Name "collisionarea"
Build-Example -Name "rlgl_solar_system"
Build-Example -Name "shapes"
Build-Example -Name "smooth_pixel_perfect_camera"
Build-Example -Name "three_d_camera_mode"


Set-Location -Path "..\rsrc\build-examples"



