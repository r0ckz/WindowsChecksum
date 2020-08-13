@setlocal
@for /f "tokens=*" %%a in (
'@certutil -hashfile %1 %2 ^|find /v "hash of file" ^|find /v "CertUtil"'
) do @(
  @set str=%%a
)
@set str=%str: =%
@echo %str%
@endlocal
