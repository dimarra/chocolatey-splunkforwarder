$ErrorActionPreference = 'Stop';


$packageName = 'splunkforwarder'
$registryUninstallerKeyName = '{2EE05143-AC0C-478F-8318-669B31ECFE20}' #ensure this is the value in the registry
$installerType = 'MSI'
$silentArgs = "$registryUninstallerKeyname /quiet"
$validExitCodes = @(0)

Uninstall-ChocolateyPackage -PackageName $packageName -FileType $installerType -SilentArgs $silentArgs -validExitCodes $validExitCodes -File $registryUninstallerKeyName
# 