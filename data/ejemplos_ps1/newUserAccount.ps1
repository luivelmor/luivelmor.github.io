# - Cuentas y Usuarios

# - Definimos usuario y password
$Secure_String_Pwd = ConvertTo-SecureString 'CLASE' -AsPlainText -Force
New-LocalUser 'clase' -Password $Secure_String_Pwd -FullName 'clase' -Description 'cuenta de clase'
# - Creamos la cuenta
Set-LocalUser -Name "clase" -AccountNeverExpires -PasswordNeverExpires $true -UserMayChangePassword $false
# - Definimos sus grupos de pertenencia
Add-LocalGroupMember 'usuarios' -Member 'clase' 
Start-Sleep -Seconds 10
# - Reiniciamos
Restart-Computer -Force

exit 0 