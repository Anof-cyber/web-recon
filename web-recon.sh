#!/bin/bash

printf "\t\e[1;91m       __          __  _       _____                        \e[0m\n"
printf "\t\e[1;91m       \ \        / / | |     |  __ \                     \e[0m\n"
printf "\t\e[1;91m        \ \  /\  / /__| |__   | |__) |___  ___ ___  _ __  \e[0m\n"
printf "\t\e[1;91m         \ \/  \/ / _ \ '_ \  |  _  // _ \/ __/ _ \| '_ \ \e[0m\n"
printf "\t\e[1;91m          \  /\  /  __/ |_) | | | \ \  __/ (_| (_) | | | |\e[0m\n"
printf "\t\e[1;91m           \/  \/ \___|_.__/  |_|  \_\___|\___\___/|_| |_|\e[0m\n"
printf "\t\e[1;33m      Web Application Reconnnaissance | Creator: @Ano_F_ (Twitter)\e[0m\n"


if [[ "$(id -u)" -ne 0 ]]; then
   printf "\e[1;91m Run this program as root!\n\e[0m"
   exit 1
fi

source ~/.bash_profile
check_requirement () {
			command -v python > /dev/null 2>&1 || { echo >&2 "Python is not installed yet | Run ./install.sh. exit."; exit 1; }
			command -v go > /dev/null 2>&1 || { echo >&2 "go is not installed yet. | Run ./install.sh. exit."; exit 1; }
			command -v curl > /dev/null 2>&1 || { echo >&2 "curl is not installed yet. | Run ./install.sh. exit."; exit 1; }
			command -v jq > /dev/null 2>&1 || { echo >&2 "jq is not installed yet. | Run ./install.sh. exit."; exit 1; }
			command -v sed > /dev/null 2>&1 || { echo >&2 "sed is not installed yet. | Run ./install.sh. exit."; exit 1; }
			command -v httprobe > /dev/null 2>&1 || { echo >&2 "HTTProbe is not installed yet. | Run ./install.sh. exit."; exit 1; }
			command -v waybackurls > /dev/null 2>&1 || { echo >&2 "sublist3r is not installed yet. | Run ./install.sh. exit."; exit 1; }
			command -v nmap > /dev/null 2>&1 || { echo >&2 "sublist3r is not installed yet. | Run ./install.sh. exit."; exit 1; }

}
check_requirement



restart () {
		printf "\n\e[1;77m[1]\e[0m\e[1;93m Go Back\e[0m\n"
		printf "\e[1;77m[2]\e[0m\e[1;93m Exit\e[0m\n"

		read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose an option: \e[0m' option

		if [[ $option == 1 || $option == 01 ]];
		then
			clear
	     		menu

		elif [[ $option == 2 || $option == 02 ]]; then
			echo -e "\n\e[1;92m Good bye\e[0m"
			exit 0

		else
			echo -e "\n\e[1;92m]invalid option Exiting Program\e[0m\n"
			exit 1
		fi

}


read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Enter the website without HTTP/HTTPS: \e[0m' website
mkdir -p $website

menu () {

	printf "\n\e[1;77m[1]\e[0m\e[1;93m Missing Respone Headers Checker\e[0m                \e[1;77m[6]\e[0m\e[1;93m Nmap SSL Certificate and Cipher Enumeration\e[0m\n"
	printf "\e[1;77m[2]\e[0m\e[1;93m waybackurls\e[0m                                    \e[1;77m[7]\e[0m\e[1;93m HTTProbe\e[0m\n"
	printf "\e[1;77m[3]\e[0m\e[1;93m Whois Lookup\e[0m                                   \e[1;77m[8]\e[0m\e[1;93m Dirsearch\e[0m\n"
	printf "\e[1;77m[4]\e[0m\e[1;93m JavaScript Link Finder\e[0m                         \e[1;77m[9]\e[0m\e[1;93m Exit\e[0m\n"
	printf "\e[1;77m[5]\e[0m\e[1;93m Subdomain\e[0m\n"
	read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose an option: \e[0m' option


	if [[ $option == 1 || $option == 01 ]]; then
		echo -e "\n\e[1;34m Sending HTTP Request to $website\e[0m\n"
		curl -I -s -L $website
		echo -e "\n\e[1;34mAnalysing the Missing Headers\e[0m\n"
		curl "https://securityheaders.com/?q=$website&followRedirects=on" -s |grep "https://scotthelme.co.uk/" | cut -d$'\n' -f1 |sed 's/<[^>]*>/\n/g' | uniq| sort -b | grep "-" | sed '/"/d' | uniq | nl
		restart



elif [[ $option == 2 || $option == 02 ]]; then
 		read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Do you have domain name in a file (y/n): \e[0m' option_wayback

			if [[ $option_wayback == 'y' || $option_wayback == 'yes' ]]; then
				read -p $'\n\e[1;92m] Enter the file location: \e[0m' file_path
				read -p $'\n\e[1;92m] Do you want to save the output (y/n): \e[0m' save

					if [[ $save == 'y' || $save == 'yes' ]]; then
						read -p $'\n\e[1;92m] Enter the file name to save: \e[0m\n' file_name
						cat $file_path | waybackurls > $file_name
						echo -e "\n\e[1;92m]done\e[0m\n"
						restart

					elif [[ $save == 'n' || $save == 'no' ]]; then
						cat $file_path | waybackurls
						echo -e "\n\e[1;92m]done\e[0m\n"
						restart
					else
						echo -e "\n\e[1;92m] Invalid Option\e[0m\n"
						clear
						menu
					fi


		elif [[ $option_wayback == 'n' || $option_wayback == 'no' ]]; then
			read -p $'\n\e[1;92m] Do you want to save the output (y/n): \e[0m\n' save

				if [[ $save == 'y' || $save == 'yes' ]]; then
					read -p $'\n\e[1;92m] Enter the file name to save: \e[0m\n' file_name
					waybackurls $website > $website/file_name
					echo -e "\n\e[1;92m]done\e[0m\n"
					restart

				elif [[ $save == 'n' || $save == 'no' ]]; then
					waybackurls $website
					restart
				else
					echo -e "\n\e[1;92m] Invalid Option\e[0m\n"
					clear
					menu
				fi
		fi



elif [[ $option == 3 || $option == 03 ]]; then
			whois $website
			restart


elif [[ $option == 4 || $option == 04 ]]; then
			echo -e "\n\e[1;92m use the same website entered above\e[0m"
			read -p $'\n\e[1;92m Enter the full path of .js: \e[0m' jsfile
			read -p $'\n\e[1;92m Enter the file name to save with .html: \e[0m' jssave
			python tools/LinkFinder/linkfinder.py -i $jsfile -o $website/$jssave
			restart

elif [[ $option == 5 || $option == 05 ]]; then
	printf "\e[1;77m[1]\e[0m\e[1;93m Sublist3r\e[0m\n"
	printf "\e[1;77m[2]\e[0m\e[1;93m Subrute\e[0m\n"
	read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose an option: \e[0m' option_subdomain

			if [[ $option_subdomain == 1 || $option_subdomain == 01 ]]; then
				read -p $'\n\e[1;92m Enther the file name to save with : \e[0m' Sublist3r_save
				echo -e "\n\e[1;92m Using Sublist3r for $website\e[0m"
				sublist3r -d $website -o $website/$Sublist3r_save
				echo -e "\n\e[1;92m Subdomain is saved in $website/$Sublist3r_save	\e[0m"
				restart

			elif [[ $option_subdomain == 2 || $option_subdomain == 02 ]]; then
					read -p $'\n\e[1;92m Enther the file name to save with : \e[0m' subbrute_save
					echo -e "\n\e[1;92m Using subbrute for $website\e[0m"
					python tools/subbrute/subbrute.py $website -r tools/subbrute/resolvers.txt -o $website/$subbrute_save
					echo -e "\n\e[1;92m Subdomain is saved in $website/$subbrute_save\e[0m"
					restart
		  else
					echo -e "\n\e[1;92m] Invalid Option\e[0m\n"
					clear
					menu
			fi


elif [[ $option == 6 || $option == 06 ]]; then
		read -p $'\n\e[1;92m Enther the file name to save with : \e[0m' nmap_save
		read -p $'\n\e[1;92m Enter the port number : \e[0m' port
		nmap --script ssl-cert,ssl-enum-ciphers -p $port $website -oN $website/$nmap_save
		echo -e "\n\e[1;92m Output is saved in $website/$nmap_save\e[0m"
		restart


elif [[ $option == 7 || $option == 07 ]]; then
	read -p $'\n\e[1;92m Enter the location where domain file is saved : \e[0m' file_location
	read -p $'\n\e[1;92m Enther the file name to save with : \e[0m' httprobe_save
	cat $file_location | HTTProbe > $website/$httprobe_save
	restart


elif [[ $option == 8 || $option == 08 ]]; then
	read -p $'\n\e[1;92m Enther the file name to save with : \e[0m' dirsearch_save
	read -p $'\n\e[1;92m Enter the file extension (use , for multiple extension without space) : \e[0m' extension
	python3 tools/dirsearch/dirsearch.py -u $website -e $extension --plain-text-report=$website/$dirsearch_save
	echo -e "\n\e[1;92m Output is saved in $website/$dirsearch_save\e[0m"
	restart

elif [[ $option == 9 || $option == 09 ]]; then
	echo -e "\n\e[1;92m Good bye\e[0m"
	exit 0


else
	echo -e "\n\e[1;92m Invalid option Can't you see the right option \e[0m"
	restart

fi

}
menu
