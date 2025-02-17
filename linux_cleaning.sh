#!/bin/bash

clear

echo -e "Check diskspace (before cleaning)"
df -h

echo -e "\n\n"

echo -e "Prune journalctl"
journalctl --vacuum-size=10M

echo -e "Prune btmp"
rm -rf /var/log/btmp.*
> /var/log/btmp

echo -e "Prune CloudPanel backups"
rm -rf /home/clp/backups/*

echo -e "\n\n"

echo -e "Check diskspace (after cleaning)"
df -h

echo -e "\n\n"

echo -e "Done!"