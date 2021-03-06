#!/bin/bash

echo "_______                          ________________________     ______________            ______              ";
echo "___    |___________________      ___  ____/__  __/__  __ \    __  ____/__  /_______________  /______________";
echo "__  /| |_  __ \  __ \_  __ \     __  /_   __  /  __  /_/ /    _  /    __  __ \  _ \  ___/_  //_/  _ \_  ___/";
echo "_  ___ |  / / / /_/ /  / / /     _  __/   _  /   _  ____/     / /___  _  / / /  __/ /__ _  ,<  /  __/  /    ";
echo "/_/  |_/_/ /_/\____//_/ /_/      /_/      /_/    /_/          \____/  /_/ /_/\___/\___/ /_/|_| \___//_/     ";
echo "                                                                                                            ";

echo "This is a script that tests the 'anonymous' login feature for FTP servers."
echo "The file should contain IP Addresses or Server/host names ONLY"
echo "The deliverables for this script will include files named after the hostnames (or IP Addresses) that were able to be accessed."
echo "These files in only include the listing of contents in the main directory of each share that was accessed via anonymous login"
echo "By William P. a.k.a Billiam Dean"
echo ""
echo ""
echo ""
echo "-------------------------------------------------------"
echo "Usage: "
echo "$ ./anon-ftp-check.sh"
echo "What is the filename (or file path) w/ IP Addresses?"
echo "$ myips.txt"
echo "-------------------------------------------------------"
echo ""
echo ""
echo ""


echo "What is the filename (or file path) w/ IP Addresses?"
read file

echo "Is using 'anonymous:anonymous' okay? (Y/n)"
read resp1
if [[ $resp1 == "N" ]] || [[ $resp1 == "n" ]]
then
        echo "What would you like the username to be?"
        read user
        echo "What would you like the password to be?"
        read pass
else
        user=anonymous
        pass=anonymous
fi

checker() {
echo
echo
echo
echo
echo
echo "--------------------------------------------------"
echo "Running w/ the following variables:"
echo "File being used: $file"
echo "Username desired: $user"
echo "Password desired: $pass"
echo "--------------------------------------------------"
echo " _______ "
echo "|Results|"
echo " ------- "
echo "###############"
for i in `cat $file`; do echo $i; curl -m 6 ftp://$i --user "$user:$pass" | tee $i.ftp_anoncheck.out; done; for i in *.ftp_anoncheck.out; do if [[ $(wc -l < $i) = 0 ]]; then rm $i; fi; done
}
checker
