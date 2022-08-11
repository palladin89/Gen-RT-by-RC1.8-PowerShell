New-Item -Path 'C:\RC18\ntlm\' -ItemType Directory
New-Item -Path 'C:\RC18\ntlm\rtc' -ItemType Directory
Copy-Item -Path 'C:\RC18\rt2rtc.exe' -Destination 'C:\RC18\ntlm'
	for ( $i = 0; $i -le 32; $i=$i+8)
{
		for ( $j = 0; $j -le 7; $j++)
	{
		.\rtgen.exe ntlm mixalpha-numeric-all-space 1 4 $i 1000 100000 $j
		sleep -seconds 1
		.\rtsort.exe C:\RC18
		sleep -seconds 1
		Move-Item -Path 'C:\RC18\*.rt' -Destination 'C:\RC18\ntlm'
		sleep -seconds 1
		cd ntlm
		sleep -seconds 1
		.\rt2rtc.exe C:\RC18\ntlm -p		#-p work norm
		Move-Item -Path 'C:\RC18\ntlm\*.rtc' -Destination 'C:\RC18\ntlm\rtc\'
		Remove-Item 'C:\RC18\ntlm\*.rt'
		sleep -seconds 1
		cd ..
	}
}
