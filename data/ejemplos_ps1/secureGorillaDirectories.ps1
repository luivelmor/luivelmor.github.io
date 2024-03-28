# - Permisos ACL
# - Uso de credenciales

# Denegamos permiso de lectura para la carpeta C:\ProgramData\gorilla
$programDataPath = "C:\ProgramData\gorilla"
$gorillaPath = "C:\gorilla"
$acl_programData = Get-Acl -Path $programDataPath
$acl_gorilla = Get-Acl -Path $gorillaPath
# Set properties
$identity = "clase"
$fileSystemRights = "FullControl"
$type = "Deny"
# Creamos una nueva regla
$fileSystemAccessRuleArgumentList = $identity, $fileSystemRights, $type
$fileSystemAccessRule = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $fileSystemAccessRuleArgumentList
# Aplicamos la nueva regla a la ACL de la carpeta seleccionada
$acl_programData.SetAccessRule($fileSystemAccessRule)
$acl_gorilla.SetAccessRule($fileSystemAccessRule)
Set-Acl -Path $programDataPath -AclObject $acl_programData 
Set-Acl -Path $gorillaPath -AclObject $acl_gorilla

exit 0 
