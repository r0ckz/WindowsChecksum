@for %%f in (*) do @echo %%f: && @%~dp0\checksum.cmd "%%f" %1
