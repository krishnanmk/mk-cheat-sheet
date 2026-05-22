# Powershell Commands

## Loops

### ForEach-Object

```ps1
(Array, Source) | ForEach-Object -Process { ... }

# Pipe foreach outputs, e.g. split/remove extension and get only file names
Get-ChildItem . | ForEach-Object { $_.Name.Split('.')[0] } | ForEach-Object { echo $_ }
```

[ForEach-Object Reference](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/foreach-object?view=powershell-7.2)

### for in code

```ps1
for ($i = 1; $i -le 1000; $i++) {
    if ((Invoke-WebRequest $url -Method Head).StatusCode -eq 200) {
        Invoke-WebRequest $url -OutFile $destFile;
        echo "Downloaded: $i";
    }
    else {
        echo "Not found: $i";
    }
}
```

## Web calls

### Download files

```ps1
Invoke-WebRequest "http://url" -OutFile "C:\temp\test.jpg"
```

### Download only if file exists

```ps1
if ((Invoke-WebRequest "http://url" -Method Head -OutFile "C:\temp\test.jpg").StatusCode -eq 200) {
    Invoke-WebRequest "http://url" -OutFile "C:\temp\test.jpg"
}
```
