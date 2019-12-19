REM 创建数字签名，在主目录运行
for /f "delims=" %%a in ('dir /a-d /b^|findstr /v /i  "\.bat"') do (gpg -u 1F017CCB7C3BFE6CEA4F5D5D3127DF05A772B61D -o sig\"%%a".sig -ab "%%a")