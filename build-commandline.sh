#!/bin/bash
############################################################
# Help                                                     #
############################################################
Help()
{
   # Display Help
   echo "Syntax: build-commandline.sh [-g|h|e|i|d]"
   echo "options:"
   echo "h     Print this Help."
   echo "i     Ip-address"
   echo "d     Domain"
   echo "e     Email"
   echo
}

############################################################
############################################################
# Main program                                             #
############################################################
############################################################

# Set variables
email=""
domain=""
ip=""

############################################################
# Process the input options. Add options as needed.        #
############################################################
# Get the options
while getopts "he:d:i:" option; do
   case $option in
      h) # display Help
         Help
         exit;;
      e) # Enter a name
         email=$OPTARG;;
      d) # domain
         domain=$OPTARG;;
      i) #
         ip=$OPTARG;;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done

if [ -z "$email" ] || [ -z "$ip" ] ||  [ -z "$domain" ]   ; then
        echo 'Missing -e or -d or -i. -h for help' >&2
        exit 1
fi

echo "building inventory.txt"

cat > inventory.txt << EOF
[openvas]
$ip

[openvas:vars]
domain_name=$domain
email=$email
host_key_checking = False
ansible_user=root
GVM_VERSION=21.4.4
GVM_LIBS_VERSION=21.4.4
GVMD_VERSION=21.4.5
GSA_VERSION=21.4.4
OPENVAS_SMB_VERSION=21.4.0
OPENVAS_SCANNER_VERSION=21.4.4
OSPD_OPENVAS_VERSION=21.4.4
GSAD_VERSION=21.4.4

EOF

echo "#commands to run:"
echo "#install gvm:"
echo "ANSIBLE_PIPELINING=1 ansible-playbook openvas-gvm.yaml -i inventory.txt  -l $ip  --private-key=/home/eero/.ssh/id_rsa"
echo ""
echo "#optional with ssl proxy"
echo "ANSIBLE_PIPELINING=1 ansible-playbook nginx-with-ssl-files.yaml  -i inventory.txt  -l $ip  --private-key=/home/eero/.ssh/id_rsa"
echo "#optional with lets encrypt"
echo "ANSIBLE_PIPELINING=1 ansible-playbook nginx-with-ssl-certbot.yaml -i inventory.txt  -l $ip  --private-key=/home/eero/.ssh/id_rsa"
