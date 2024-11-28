#!/bin/bash

func_monitorar() {
    echo "Hostname: $(hostname)"
    echo "Data atual: $(date)"
    echo "Versão atual do kernel e arquitetura da CPU: $(uname -rp)"
    echo ""

    echo "Uso da CPU:"
    sar -u 1 1 | grep -v 'Linux' | tail -3
    echo ""

    echo "Uso da RAM:"
    sar -r 1 1 | grep -v 'Linux' | tail -3
    echo ""

    echo "Uso de SWAP:"
    sar -S 1 1 | grep -v 'Linux' | tail -3
    echo ""

    echo "Atual I/O do disco:"
    sar -d 1 1 | grep -E '(DEV|sd|vd)' | grep -v 'Linux' | tail -3
    echo ""

    echo "Uso da largura de banda:"
    sar -n DEV 1 1 | grep -v lo | grep -v 'Linux' | tail -3
}