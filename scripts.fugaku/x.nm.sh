#!/bin/bash
module load lang
module list
set -x

nm -D /opt/FJSVxos/devkit/aarch64/rfs/usr/lib64/libpapi.so
nm -D /opt/FJSVxos/devkit/aarch64/rfs/usr/lib64/libpfm.so

