# WindowsChecksum
### Explanation
When I need to get a MD5 or SHA-1 hash for a file on Windows, there are many tools available. HashCheck and HashMyFiles are two examples. However, on some systems I don't have the ability to use third party applications. In later Windows versions there are PowerShell options too, but I prefer to use the following CMD command:
```
certutil -hashfile file.zip SHA1
```
This works, but it will give you a hash with spaces. To avoid this, we can use checksum.cmd. This removes spaces and even gives you the option to write the hash to a file.

### Usage
Simply save the script, navigate CMD to the directory containing the file and do:
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

# Note about different Windows versions
These scripts are tested on Windows 7, 10 and Windows Server 2019. On Windows XP/Server 2003 you need the Windows Server 2003 Administration Pack to install certutil.

In the future, the output of certutil might change, which may cause the hash-isolating filters in "checksum.cmd" to break. If that happens, you'll need to change the "find /v" parts right after the certutil command. For example, you could try to filter out lines containing the ":" symbol. At this moment, certutil shows three lines. One contains the hash, the other ones are text and they both have ":" in them. I haven't tried this yet and also don't prefer this - since what it does is less self-explanatory. But it's a good thing to keep in mind.

Windows 8 and later already removed the extraneous spaces from the hash, which makes the "Set Str" commands useless. You won't notice this in your output. That's why I decided to leave it in: to give Windows 7 users the ability to get the same output.
