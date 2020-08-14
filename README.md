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
C:\checksum.cmd file.zip SHA1 C:\output.txt
```
# checksum-folder.cmd
### How to use
I also made a little extension called "checksum-folder.cmd", which is basically just a very simple one-lined for-loop. It's used to calculate all hashes for files in a folder with a single command.

Just put it in the same folder as your "checksum.cmd" and type:
```
cd C:\test
C:\tools\checksum-folder.cmd SHA1
```
This will show you the SHA-1 hashes for all files in the folder 'test' on drive C.

You can also choose to write the output to a txt file in the same folder:
```
C:\tools\checksum-folder.cmd SHA1 > output.txt
```
Of course, you'll have to adjust this to your own needs.

A little example of what you could change: let's say you want to calculate the hash of files in all subfolders too, and specify the main folder in the command instead of using cd.

You could replace the contents of "checksum-folder.cmd" with:
```
@for /R %1 %%f in (*) do @echo %%f: && @%~dp0\checksum.cmd "%%f" %2
```
And use it this way:
```
C:\tools\checksum-folder.cmd C:\test SHA1
```
Because of "/R", this will give you the hashes of all files in the folder test, as specified in the command - including subfolders. This can be very useful if you're working with large folders.
