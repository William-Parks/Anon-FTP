#!/bin/bash

echo "_______                          ________________________     ______________            ______              ";
echo "___    |___________________      ___  ____/__  __/__  __ \    __  ____/__  /_______________  /______________";
echo "__  /| |_  __ \  __ \_  __ \     __  /_   __  /  __  /_/ /    _  /    __  __ \  _ \  ___/_  //_/  _ \_  ___/";
echo "_  ___ |  / / / /_/ /  / / /     _  __/   _  /   _  ____/     / /___  _  / / /  __/ /__ _  ,<  /  __/  /    ";
echo "/_/  |_/_/ /_/\____//_/ /_/      /_/      /_/    /_/          \____/  /_/ /_/\___/\___/ /_/|_| \___//_/     ";
echo "                                                                                                            ";

echo "This is a script that tests the 'anonymous' login feature for FTP servers."
echo "This file should contain IP Addresses or Server/host names ONLY"
echo "By Billiam Dean"
echo ""
echo ""

echo "What is the filename (or file path) w/ IP Addresses?"
read file

for i in `cat $file`; do echo $i; curl -m 6 ftp://$i --user "anonymous:anonymous" | tee $i.ftp_anoncheck.out; done; for i in *.ftp_anoncheck.out; do if [[ $(wc -l < $i) = 0 ]]; then rm $i; fi; done