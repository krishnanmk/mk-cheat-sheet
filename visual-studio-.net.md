# Visual Studio

## NuGet Commands

```cmd
REM  Force update NuGet package
Update-Package -reinstall [PackageName] [-Project ProjectName]
```

## When moving projects

1. If Code Analysis enabled (FxCop.exe based analyzers), after project moved, change location of following directly in `.csproj`.
   1. Rule Set
   2. Code Analysis Dictionary
2. Change paths of `.editorconfig`, if any.
3. Change paths of `<Reference>` libraries.
   1. Your solution projects paths.
   2. NuGet packages paths.

## When upgrading framework version

1. `\net40\`.
2. NuGet framework `Update-Package -reinstall -projectname <projectname>`.
