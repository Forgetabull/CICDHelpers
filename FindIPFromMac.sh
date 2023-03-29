#!/bin/bash
ip neighbor | grep -i "$1" | cut -d" " -f1

