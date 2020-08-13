# WindowsChecksum
### Explanation
When I need to get a MD5 or SHA-1 hash for a file on Windows, there are many tools available. HashCheck and HashMyFiles are two examples. However, on some systems I don't have the ability to use third party applications. In later Windows versions there are PowerShell options too, but I prefer to use the following CMD command:
```
certutil -hashfile "file.zip" SHA1
```
This works, but it will give you a hash with spaces. To avoid this, we can use checksum.cmd. This removes spaces and even gives you the option to write the hash to a file.

### Usage
Simply save the script and do:
```
C:\checksum.cmd file.zip SHA1
```
This will output ONLY the specified type of hash of the file, without unnecessary lines or spaces.

### Extra option
If you want to automatically save the hash to a file,

Change the following line:
```
@echo %str%
```
to
```
@echo %str% > %3
```
And add the output file as the third parameter in your command:
```
C:\checksum.cmd file.zip SHA1 output.txt
```
