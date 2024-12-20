#!/bin/bash

# Function to display the banner once
display_banner() {
    clear
    echo -e "\033[1;36m
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@  @@@  @@@@@@@@  @@@       @@@@@@@   @@@@@@@@  @@@@@@@      @@@  @@@  @@@  @@@  @@@@@@@
@@@  @@@  @@@@@@@@  @@@       @@@@@@@@  @@@@@@@@  @@@@@@@@     @@@  @@@  @@@  @@@  @@@@@@@@
@@!  @@@  @@!       @@!       @@!  @@@  @@!       @@!  @@@     @@!  @@@  @@!  @@@  @@!  @@@
!@!  @!@  !@!       !@!       !@!  @!@  !@!       !@!  @!@     !@!  @!@  !@!  @!@  !@   @!@
@!@!@!@!  @!!!:!    @!!       @!@@!@!   @!!!:!    @!@!!@!      @!@!@!@!  @!@  !@!  @!@!@!
!!!@!!!!  !!!!!:    !!!       !!@!!!    !!!!!:    !!@!@!       !!!@!!!!  !@!  !!!  !!!@!!!!
!!:  !!!  !!:       !!:       !!:       !!:       !!: :!!      !!:  !!!  !!:  !!!  !!:  !!!
:!:  !:!  :!:        :!:      :!:       :!:       :!:  !:!     :!:  !:!  :!:  !:!  :!:  !:!
::   :::   :: ::::   :: ::::   ::        :: ::::  ::   :::     ::   :::  ::::: ::   :: ::::
 :   : :  : :: ::   : :: : :   :        : :: ::    :   : :      :   : :   : :  :   :: : :
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 
                Author:A!Z3N(Dharan) || Made with power
                Welcome to the Helper Hub - Tool Installer
                Simplifying Cybersecurity Tool Management
\033[0m"
}

# Function to check and install tools
check_and_install_tool() {
    local tool=$1
    local github_url=$2

    if command -v "$tool" &> /dev/null; then
        echo -e "\033[1;32m$tool is already installed. Launching it...\033[0m"
        "$tool"
        return
    fi

    echo -e "\033[1;33m$tool is not installed. Checking installation options...\033[0m"
    if apt-cache show "$tool" &> /dev/null; then
        sudo apt update && sudo apt install -y "$tool"
        echo -e "\033[1;32m$tool installed successfully via apt.\033[0m"
        "$tool"
    else
        echo -e "\033[1;31m$tool is not available via apt. Attempting to download from GitHub...\033[0m"
        local tool_dir="${tool}_repo"
        if [ ! -d "$tool_dir" ]; then
            git clone "$github_url" "$tool_dir"
            echo -e "\033[1;32m$tool downloaded from GitHub.\033[0m"
        fi
        cd "$tool_dir" || exit
        chmod +x "$tool" 2>/dev/null || echo -e "\033[1;31mEnsure $tool has executable permissions.\033[0m"
        ./"$tool" 2>/dev/null || echo -e "\033[1;33mRun the tool manually from $tool_dir.\033[0m"
    fi
}
how_to_use() {
    clear
    display_banner
    echo -e "\033[1;34mHow to Use Helper Hub:\033[0m"
    echo -e "
1. Choose a category from the main menu based on your needs:
   - Information Gathering
   - Privilege Escalation
   - Vulnerability Scanning
   - Exploitation Tools
   - Post-Exploitation
   - Wireless Tools
   - Forensics

2. Select a tool from the chosen category. The tool list includes both:
   - Tools available via apt (like nmap, nikto, etc.).
   - Tools hosted on GitHub (like LinPEAS, Empire, etc.).

3. The script will check if the tool is installed:
   - If installed, it will launch the tool directly.
   - If not installed, it will attempt to install it via apt or GitHub.

4. Follow the instructions for using the selected tool as per its documentation.

5. Use 'Exit' to quit the script.
    "
    read -rp "Press Enter to return to the main menu..."
}

# Function to check if the tool is installed and navigate accordingly
check_tool() {
    clear
    echo -e "\033[1;34mEnter the name of the tool to check: \033[0m"
    read -rp "Tool name: " tool_name
    if command -v "$tool_name" &> /dev/null; then
        echo -e "\033[1;32m$tool_name is already installed.\033[0m"
    else
        echo -e "\033[1;31m$tool_name is not installed. Please choose the 'Install Tool' option to install it.\033[0m"
    fi
    read -rp "Press Enter to return to the main menu..."
}
# Main menu loop
while true; do
    # Show banner once
    display_banner

    echo -e "\033[1;34mSelect an Option:\033[0m"
    echo "1. Install Tool"
    echo "2. Check Tool"
    echo "3. How to use!"
    echo "4. Exit"
    read -rp "Enter your choice: " option

    case $option in
        1)
            echo -e "\033[1;34mSelect a Category to Install a Tool:\033[0m"
            echo "1. Information Gathering"
            echo "2. Privilege Escalation"
            echo "3. Vulnerability Scanning"
            echo "4. Exploitation Tools"
            echo "5. Post-Exploitation"
            echo "6. Wireless Tools"
            echo "7. Forensics"
            read -rp "Enter your choice: " category

            case $category in
                1)
                    echo -e "\033[1;34mInformation Gathering Tools:\033[0m"
                    echo "1. Nmap (apt)"
                    echo "2. Recon-ng (GitHub)"
                    echo "3. TheHarvester (apt)"
                    echo "4. Netcat (apt)"
                    echo "5. Gobuster (GitHub)"
                    echo "6. Shodan (GitHub)"
                    echo "7. Masscan (GitHub)"
                    echo "8. DNSRecon (GitHub)"
                    read -rp "Choose a tool: " choice
                    case $choice in
                        1) check_and_install_tool "nmap" "" ;;
                        2) check_and_install_tool "recon-ng" "https://github.com/lanmaster53/recon-ng.git" ;;
                        3) check_and_install_tool "theharvester" "" ;;
                        4) check_and_install_tool "netcat" "" ;;
                        5) check_and_install_tool "gobuster" "https://github.com/OJ/gobuster.git" ;;
                        6) check_and_install_tool "shodan" "https://github.com/achillean/shodan-python.git" ;;
                        7) check_and_install_tool "masscan" "https://github.com/robertdavidgraham/masscan.git" ;;
                        8) check_and_install_tool "dnsrecon" "https://github.com/darkoperator/dnsrecon.git" ;;
                    esac
                    ;;
                2)
                    echo -e "\033[1;34mPrivilege Escalation Tools:\033[0m"
                    echo "1. LinPEAS (GitHub)"
                    echo "2. WinPEAS (GitHub)"
                    echo "3. Linux Exploit Suggester (GitHub)"
                    echo "4. Windows Exploit Suggester (GitHub)"
                    echo "5. PEASS-ng (GitHub)"
                    echo "6. GTFOBins (GitHub)"
                    echo "7. Sudo-killer (GitHub)"
                    read -rp "Choose a tool: " choice
                    case $choice in
                        1) check_and_install_tool "linpeas" "https://github.com/carlospolop/PEASS-ng.git" ;;
                        2) check_and_install_tool "winpeas" "https://github.com/carlospolop/PEASS-ng.git" ;;
                        3) check_and_install_tool "linux-exploit-suggester" "https://github.com/mzet-/linux-exploit-suggester.git" ;;
                        4) check_and_install_tool "windows-exploit-suggester" "https://github.com/anjay-yadavi/windows-exploit-suggester.git" ;;
                        5) check_and_install_tool "peass-ng" "https://github.com/carlospolop/PEASS-ng.git" ;;
                        6) check_and_install_tool "gtfobins" "https://github.com/GTFOBins/GTFOBins.github.io.git" ;;
                        7) check_and_install_tool "sudo-killer" "https://github.com/TH3xACE/Sudo_Killer.git" ;;
                    esac
                    ;;
                3)
                    echo -e "\033[1;34mVulnerability Scanning Tools:\033[0m"
                    echo "1. Nikto (apt)"
                    echo "2. Nessus (GitHub)"
                    echo "3. OpenVAS (apt)"
                    echo "4. Arachni (GitHub)"
                    echo "5. Burp Suite (apt)"
                    echo "6. Qualys (GitHub)"
                    echo "7. WPScan (GitHub)"
                    read -rp "Choose a tool: " choice
                    case $choice in
                        1) check_and_install_tool "nikto" "" ;;
                        2) check_and_install_tool "nessus" "https://github.com/tenable/nessus.git" ;;
                        3) check_and_install_tool "openvas" "" ;;
                        4) check_and_install_tool "arachni" "https://github.com/arachni/arachni.git" ;;
                        5) check_and_install_tool "burpsuite" "" ;;
                        6) check_and_install_tool "qualys" "https://github.com/qualys/qualys.git" ;;
                        7) check_and_install_tool "wpscan" "https://github.com/wpscanteam/wpscan.git" ;;
                    esac
                    ;;
                4)
                    echo -e "\033[1;34mExploitation Tools:\033[0m"
                    echo "1. Metasploit Framework (apt)"
                    echo "2. SQLmap (apt)"
                    echo "3. BeEF (GitHub)"
                    echo "4. Exploitdb (GitHub)"
                    echo "5. SEToolkit (apt)"
                    echo "6. Social-Engineer Toolkit (GitHub)"
                    echo "7. Hydra (apt)"
                    read -rp "Choose a tool: " choice
                    case $choice in
                        1) check_and_install_tool "msfconsole" "" ;;
                        2) check_and_install_tool "sqlmap" "" ;;
                        3) check_and_install_tool "beef" "https://github.com/beefproject/beef.git" ;;
                        4) check_and_install_tool "exploitdb" "https://github.com/offensive-security/exploitdb.git" ;;
                        5) check_and_install_tool "setoolkit" "" ;;
                        6) check_and_install_tool "social-engineer-toolkit" "https://github.com/trustedsec/social-engineer-toolkit.git" ;;
                        7) check_and_install_tool "hydra" "" ;;
                    esac
                    ;;
                5)
                    echo -e "\033[1;34mPost-Exploitation Tools:\033[0m"
                    echo "1. Empire (GitHub)"
                    echo "2. PowerShell Empire (GitHub)"
                    echo "3. Cobalt Strike (GitHub)"
                    echo "4. Metasploit Payloads (apt)"
                    echo "5. AsyncRat (GitHub)"
                    echo "6. Pupy (GitHub)"
                    echo "7. QuasarRAT (GitHub)"
                    read -rp "Choose a tool: " choice
                    case $choice in
                        1) check_and_install_tool "empire" "https://github.com/EmpireProject/Empire.git" ;;
                        2) check_and_install_tool "powershell-empire" "https://github.com/EmpireProject/Empire.git" ;;
                        3) check_and_install_tool "cobaltstrike" "https://github.com/CobaltStrike/cobaltstrike.git" ;;
                        4) check_and_install_tool "metasploit" "" ;;
                        5) check_and_install_tool "asyncRAT" "https://github.com/ASyncRAT/AsyncRAT.git" ;;
                        6) check_and_install_tool "pupy" "https://github.com/n1nj4sec/pupy.git" ;;
                        7) check_and_install_tool "quasar" "https://github.com/quasar/QuasarRAT.git" ;;
                    esac
                    ;;
                6)
                    echo -e "\033[1;34mWireless Tools:\033[0m"
                    echo "1. Aircrack-ng (apt)"
                    echo "2. Reaver (GitHub)"
                    echo "3. Kismet (apt)"
                    echo "4. Wireshark (apt)"
                    echo "5. Wifite (GitHub)"
                    echo "6. Fluxion (GitHub)"
                    echo "7. Fern Wifi Cracker (GitHub)"
                    read -rp "Choose a tool: " choice
                    case $choice in
                        1) check_and_install_tool "aircrack-ng" "" ;;
                        2) check_and_install_tool "reaver" "https://github.com/t6x/reaver-wps-fork-t6x.git" ;;
                        3) check_and_install_tool "kismet" "" ;;
                        4) check_and_install_tool "wireshark" "" ;;
                        5) check_and_install_tool "wifite" "https://github.com/derv82/wifite.git" ;;
                        6) check_and_install_tool "fluxion" "https://github.com/wi-fi-analyzer/fluxion.git" ;;
                        7) check_and_install_tool "fern-wifi-cracker" "https://github.com/savio-code/fern-wifi-cracker.git" ;;
                    esac
                    ;;
                7)
                    echo -e "\033[1;34mForensics Tools:\033[0m"
                    echo "1. Autopsy (apt)"
                    echo "2. Sleuth Kit (GitHub)"
                    echo "3. Volatility (GitHub)"
                    echo "4. Xplico (GitHub)"
                    echo "5. OSForensics (GitHub)"
                    echo "6. Hashdeep (GitHub)"
                    echo "7. FTK Imager (GitHub)"
                    read -rp "Choose a tool: " choice
                    case $choice in
                        1) check_and_install_tool "autopsy" "" ;;
                        2) check_and_install_tool "sleuthkit" "https://github.com/sleuthkit/sleuthkit.git" ;;
                        3) check_and_install_tool "volatility" "https://github.com/volatilityfoundation/volatility.git" ;;
                        4) check_and_install_tool "xplico" "https://github.com/xplico/xplico.git" ;;
                        5) check_and_install_tool "osforensics" "https://github.com/komarov-sv/OSForensics.git" ;;
                        6) check_and_install_tool "hashdeep" "https://github.com/jesobreira/hashdeep.git" ;;
                        7) check_and_install_tool "ftk-imager" "https://github.com/ForensicTools/FTKImager.git" ;;
                    esac
                    ;;
            esac
            ;;
        2)
            echo "Checking for installed tools..."
            check_tool
            ;;
        3)
            echo "Showing tool usage instructions..."
            how_to_use
            ;;
        4)
            echo "Thank you for using coming again later see yah :) !!"
            exit 0
            ;;
        *)
            echo -e "\033[1;31mInvalid option. Please try again.\033[0m"
            ;;
    esac
done
