# Unix & SSH Commands

## Files

### Directory Browsing

```sh
ls
ls -l -s        # print names in long listing format with file size
```

### Find

```sh
find [PATH] -name "file.name"
find [PATH] -iname "file.name"      # case-insensitive
```

### Download

Use the following command to download log files from \*nix server to your local machine. For Windows, you need `Putty` installed in your system along with `pscp` command line tools.

```cmd
pscp [USER_NAME]@[IP_ADDRESS]:[REMOTE_PATH_OF_FILE_TO_COPY] [LOCAL_PATH_TO_DOWNLOAD_TO]
rem After running above command, it will ask you for password.
```
