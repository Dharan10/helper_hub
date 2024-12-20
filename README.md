
# Helper_hub

The **Helper_hub** is a command-line utility designed to simplify the installation and management of various cybersecurity tools. It organizes tools into categories such as **Information Gathering**, **Privilege Escalation**, **Vulnerability Scanning**, **Exploitation Tools**, **Post-Exploitation**, **Wireless Tools**, and **Forensics**. 

With this tool, users can:
- Easily check if a specific tool is installed.
- Install missing tools directly from package managers (`apt`) or GitHub repositories.
- Launch tools directly from the script.
- Navigate through different categories to select and install the necessary tools for their cybersecurity tasks.

This script is intended to streamline the setup process for cybersecurity professionals, penetration testers, and ethical hackers.


## Description

This is an interactive tool installer script for cybersecurity professionals. It allows users to easily install and manage popular tools across multiple categories, including:

- Information Gathering
- Privilege Escalation
- Vulnerability Scanning
- Exploitation Tools
- Post-Exploitation
- Wireless Tools
- Forensics

The script checks if a tool is installed, and if not, it installs the tool either via `apt` or from GitHub repositories. It also provides a simple command-line interface to interact with.

## Features

- **Install Tools**: Automatically installs tools from popular GitHub repositories or through the `apt` package manager.
- **Check Installed Tools**: Verify if a tool is already installed and run it directly.
- **Category-Based Selection**: Tools are grouped into categories for easy selection.
- **Error Handling**: Proper error messages and instructions if something goes wrong.

## Installation

To use this tool, follow the steps below:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Dharan10/helper_hub.git
   cd tool-installer
2. **Make the script executable**:
    ```bash
    chmod +x helper_hub.sh
3. **Run the script**:
    ```bash
    ./helper_hub

## Available Tools
**Information Gathering**
- Nmap (apt)
- Recon-ng (GitHub)
- TheHarvester (apt)
- Netcat (apt)
- Gobuster (GitHub)
- Shodan (GitHub)
- Masscan (GitHub)
- DNSRecon (GitHub)
  
**Privilege Escalation**
- LinPEAS (GitHub)
- WinPEAS (GitHub)
- SudoKiller (GitHub)
- GTFOBins (GitHub)
- Lynis (apt)
- Linux Exploit Suggester (GitHub)
- Windows Exploit Suggester (GitHub)
- Pspy (GitHub)
  
**Vulnerability Scanning**
- Nikto (apt)
- Nessus (GitHub)
- OpenVAS (apt)
- Nmap NSE Scripts (apt)
- Vulners (GitHub)
- WPScan (GitHub)
- ZAP (GitHub)
- Arachni (GitHub)
  
**Exploitation Tools**
- Metasploit Framework (apt)
- SQLmap (apt)
- Empire (GitHub)
- MSFvenom (apt)
- BeEF (GitHub)
- Social-Engineer Toolkit (SET) (GitHub)
- Cobalt Strike (GitHub)
- Exploit Database (GitHub)
  
**Post-Exploitation**
- Empire (GitHub)
- PowerShell Empire (GitHub)
- Netcat (apt)
- Mimikatz (GitHub)
- Creepy (GitHub)
- Responder (GitHub)
- Kerberos Brute Force (GitHub)
- Rubeus (GitHub)
  
**Wireless Tools**
- Aircrack-ng (apt)
- Reaver (GitHub)
- Wireshark (apt)
- Kismet (apt)
- Wifite (GitHub)
- Fern Wifi Cracker (GitHub)
- Bully (GitHub)
- Mdk3 (apt)
  
**Forensics Tools**
- Autopsy (apt)
- Sleuth Kit (GitHub)
- Volatility (GitHub)
- Plaso (GitHub)
- X1 Search (GitHub)
- Hashcat (GitHub)
- Sherlog (GitHub)
## License
This project is licensed under the MIT License - see the LICENSE file for details.
