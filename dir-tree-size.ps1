param(
    [string]$Path = "C:\Your\Target\Path"
)

Get-ChildItem -Path $Path -Directory -Force | ForEach-Object {
    $size = (Get-ChildItem -Path $_.FullName -Recurse -File -Force | 
             Measure-Object -Property Length -Sum).Sum
    [PSCustomObject]@{
        Directory = $_.Name
        SizeMB    = [math]::Round($size / 1MB, 2)
    }
} | Sort-Object SizeMB -Descending | Format-Table -AutoSize
