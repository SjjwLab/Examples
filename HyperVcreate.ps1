# Objective: Create a Virtual Machine in Hyper-V
# Use: Quickly spin up Hyper-V VMs for testing

# Define Variables
$VMName = "IntuneDemo"
$VMPath = "C:\VMs\$VMName"
$VHDPath = "C:\VMs\$VMName.vhdx"
$SwitchName = "Default Switch"
$VMISO = "C:\VM ISOs\Win11.iso"

# Create VM
New-VM -Name $VMName `
 -MemoryStartupBytes 4GB `
 -NewVHDPath $VHDPath `
 -NewVHDSizeBytes 20GB `
 -Generation 2 `
 -SwitchName $SwitchName `
 -Path $VMPath;
 
 Set-VMProcessor -VMName $VMName -Count 2

 #Enable Virtual TPM
 Set-VMKeyProtector -VMName $VMName -NewLocalKeyProtector
 Enable-VMTPM -VMName $VMName

 # Add VM DVD drive
 Add-VMDvdDrive -VMName $VMName
 # Attach ISO file
 Set-VMDvdDrive -VMName $VMName -Path $VMISO
 # Set first boot device to DVD
 Set-VMFirmware -VMName $VMName -FirstBootDevice $(Get-VMDvdDrive -VMName "$VMName")
