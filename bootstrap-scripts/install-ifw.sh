#!/bin/bash

set -e

case "${1}" in
  sv1)
    bootmac="52:54:00:44:C9:2E"
    ;;
  sv2)
    bootmac="52:54:00:44:C7:2E"
    ;;
  pa)
    : TBD
    ;;
  *)
    echo "supply a site to bootstrap ifw in (sv1|sv2|pa)"
    exit 1
    ;;
esac

virt-install --pxe --name ifw.${1} --memory 384 --os-variant openbsd4 --disk size=12 --graphics none --network bridge=netmgmt,mac=${bootmac} --network bridge=vmm --network bridge=virthost --network bridge=transit --noautoconsole --wait -1
