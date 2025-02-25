#!/bin/bash

set -xeo pipefail

export GOFLAGS="'-ldflags=-X main.version=${PKG_VERSION}'"
unset CONDA_GO_COMPILER
go build -o act main.go
mkdir $PREFIX/bin
install -m 775 act $PREFIX/bin/
# TODO: This is due to a bug in our go-lang patch
# Error message is go install can't write to GOBIN when cross compiling
go-licenses save . --save_path "./license-files/"
