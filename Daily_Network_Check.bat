@echo off
color 0A

:MENU
cls
echo ============================================
echo        NETWORK / SYSTEM ADMIN TOOLKIT
echo ============================================
echo.
echo  1. Show IP Configuration
echo  2. DHCP Release/Renew
echo  3. DNS Lookup Google
echo  4. Flush DNS Cache
echo  5. Ping Default Gateway
echo  6. Ping Google DNS
echo  7. Traceroute Google
echo  8. Show ARP Table
echo  9. Show Routing Table
echo 10. Active Connections
echo 11. Network Adapters
echo 12. Open Ports
echo 13. Shared Folders
echo 14. Logged In Users
echo 15. Running Services
echo 16. Running Processes
echo 17. Disk Health
echo 18. Disk Space
echo 19. System Information
echo 20. CPU Information
echo 21. RAM Information
echo 22. Installed Updates
echo 23. Windows Activation
echo 24. Firewall Status
echo 25. Defender Status
echo 26. Last 20 System Errors
echo 27. Restart Print Spooler
echo 28. GPUpdate Force
echo 29. Test Internet and DNS
echo 30. Check Domain Connectivity
echo.
echo 99. Exit
echo.
set /p choice=Enter Choice:

if %choice%==1 ipconfig /all
if %choice%==2 (
    ipconfig /release
    ipconfig /renew
)
if %choice%==3 nslookup google.com
if %choice%==4 ipconfig /flushdns
if %choice%==5 ping -n 4 192.168.1.1
if %choice%==6 ping -n 4 8.8.8.8
if %choice%==7 tracert google.com
if %choice%==8 arp -a
if %choice%==9 route print
if %choice%==10 netstat -ano
if %choice%==11 wmic nic where "NetEnabled=true" get Name,Speed
if %choice%==12 netstat -ab
if %choice%==13 net share
if %choice%==14 query user
if %choice%==15 sc query
if %choice%==16 tasklist
if %choice%==17 wmic diskdrive get model,status
if %choice%==18 wmic logicaldisk get caption,freespace,size
if %choice%==19 systeminfo
if %choice%==20 wmic cpu get name
if %choice%==21 systeminfo | findstr /C:"Total Physical Memory"
if %choice%==22 wmic qfe list
if %choice%==23 slmgr /xpr
if %choice%==24 netsh advfirewall show allprofiles
if %choice%==25 powershell Get-MpComputerStatus
if %choice%==26 wevtutil qe System /c:20 /rd:true /f:text
if %choice%==27 (
    net stop spooler
    net start spooler
)
if %choice%==28 gpupdate /force
if %choice%==29 (
    ping 8.8.8.8
    nslookup google.com
)
if %choice%==30 (
    nltest /dsgetdc:
)

if %choice%==99 exit

echo.
pause
goto MENU