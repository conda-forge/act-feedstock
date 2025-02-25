@echo on

set GOFLAGS='-ldflags=-X main.version=%PKG_VERSION% '
if errorlevel 1 exit 1
go build -o act main.go
if errorlevel 1 exit 1
dir
if errorlevel 1 exit 1
mkdir %PREFIX%/bin
if errorlevel 1 exit 1
copy act %PREFIX%/bin/act.exe
if errorlevel 1 exit 1
dir %PREFIX%/bin
if errorlevel 1 exit 1

@REM TODO: This is due to a bug in our go-lang patch
@REM Error message is go install can't write to GOBIN when cross compiling
go-licenses save . --save_path "./license-files/"
if errorlevel 1 exit 1
