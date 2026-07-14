# Windows Hacks

Terminal command for deleting a cached network credentials to a shared drive connected via Windows Explorer.

```ps1
net use # check all active connections
net use <connection> /delete

# change default `Downloads` location; has some caveats
Set-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders' -Name '{374DE290-123F-4565-9164-39C4925E467B}' -Value 'your-path-without-/-at-end'
```

## Disk clean-up

```ps1
.\dir-tree-size.ps1 -Path <your-path>

Dism.exe /Online /Cleanup-Image /StartComponentCleanup /ResetBase
```

### How to Reverse Trackpad Scrolling on MacBook (Windows Boot Camp)

1. Open Device Manager: Right-click the Start button and select Device Manager.
2. Find the Trackpad: Expand Mice and other pointing devices, right-click HID-compliant mouse, and select Properties.
3. Get Hardware ID: Go to the Details tab, click the "Property" dropdown, and choose Device instance path. Note the `VID_XXXX&PID_XXXX` value.
4. Open Registry Editor: Press `Win + R`, type `regedit`, and hit Enter.
5. Navigate to Path: Go to `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\HID\`.
6. Locate Device Folder: Expand the folder matching your specific `VID_XXXX` path from Step 3, then open its subfolders to find Device Parameters.
7. Modify Registry Key: Double-click FlipFlopWheel and change its value data from `0` to `1`.
8. Reboot: Restart your MacBook to apply the changes.
