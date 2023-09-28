###############################################
# obtenemos la información cpu & motherboard
###############################################
$Win32_Baseboard = Get-CimInstance -ClassName Win32_Baseboard
$Win32_Processor = Get-CimInstance -ClassName Win32_Processor

# cpu
$cpu = $Win32_Processor.Name | Out-String
$cpu = $cpu.Trim()
# motherboard
$motherboard = ($Win32_Baseboard.Manufacturer + " - " + $Win32_Baseboard.Product) | Out-String
$motherboard = $motherboard.Trim()

Write-Host $cpu "-" $motherboard