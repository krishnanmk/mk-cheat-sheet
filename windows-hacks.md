# Windows Hacks

Terminal command for deleting a cached network credentials to a shared drive connected via Windows Explorer.

```ps1
net use # check all active connections
net use <connection> /delete
```

## Disk clean-up

```ps1
.\dir-tree-size.ps1 -Path <your-path>

Dism.exe /Online /Cleanup-Image /StartComponentCleanup /ResetBase
```
