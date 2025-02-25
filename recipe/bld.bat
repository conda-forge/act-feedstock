set GOFLAGS='-ldflags=-X main.version=%PKG_VERSION% '
go build -o act main.go
dir
mkdir %PREFIX%/bin
copy act %PREFIX%/bin/act.exe
dir %PREFIX%/bin

@REM TODO: This is due to a bug in our go-lang patch
@REM Error message is go install can't write to GOBIN when cross compiling
go-licenses save . --save_path "./license-files/"
