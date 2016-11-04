##dont forget the icon!

$ErrorActionPreference = 'Stop';


$packageName = 'splunkforwarder'
$version = '6.4.2'
$suffix = '00f5bb3fa822' 
$registryUninstallerKeyName = 'splunkforwarder' #ensure this is the value in the registry
$installerType = 'MSI'
$original_url = "https://download.splunk.com/products/universalforwarder/releases/$version/windows"
$internal_url = 'http://ip-172-31-30-47.ap-southeast-2.compute.internal/splunk'
$url =   "$internal_url/$packageName-$version-$suffix-x86-release.msi"
$url64 = "$internal_url/$packageName-$version-$suffix-x64-release.msi"
$silentArgs = '/quiet' # "/s /S /q /Q /quiet /silent /SILENT /VERYSILENT" # try any of these to get the silent installer #msi is always /quiet
$validExitCodes = @(0)
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" ["$url64"  -validExitCodes $validExitCodes -checksum $checksum -checksumType $checksumType -checksum64 $checksum64 -checksumType64 $checksumType64]
$packageParameters = $env:chocolateyPackageParameters;

if (!($packageParameters -like "*RECEIVING_INDEXER*") -and !($packageParameters -like "*DEPLOYMENT_SERVER*"))
{
	Write-Warning "Did not specify RECEIVING_INDEXER or DEPLOYMENT_SERVER. It's a good idea to set one of these. Refer to the documentation"
}
Write-Output "Installing with  $packageParameters AGREETOLICENSE=Yes $silentArgs"

Install-ChocolateyPackage "$packageName" "$installerType" "$packageParameters AGREETOLICENSE=Yes $silentArgs" "$url" "$url64"

