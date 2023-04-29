# Builds on Top of Choco-Proxy

# Install boxstarter with chocolatey and basic configuration
. { iwr -useb https://boxstarter.org/bootstrapper.ps1 } | iex; get-boxstarter -Force
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
Set-TimeZone -Name "Eastern Standard Time" -Verbose

# Packages
choco feature enable -n allowGlobalConfirmation
choco install 7zip
choco install git
choco install posh-git

# languages
choco install python3 pip
choco install golang
choco install awscli
choco install azure-cli
refreshenv
pip install virtualenv

# Proxy software
choco install proxifier
choco install openjdk11
choco install burp-suite-community
choco install firefox

# Proxy Tools
$tools = "C:\Tools"
mkdir $tools
cd $tools

# Fireprox
git clone https://github.com/mellonaut/fireprox
cd fireprox
virtualenv -p python3 .
# source bin/activate
pip install -r requirements.txt
python fire.py


# Analyst Tools
# Packages
choco install nmap
choco install feroxbuster
choco install sysinternals --params "/InstallDir:C:\tools\sysinternals"
choco install die
choco install pebear
choco install hollowshunter
choco install pestudio

# IPSee
cd $tools
git clone https://github.com/mellosec/IPsee

# DeepBlueCli 
cd $tools
git clone https://github.com/sans-blue-team/DeepBlueCLI.git

# Shodan
cd $tools
git clone https://github.com/simeononsecurity/Shodan_PS

# VT
cd $tools
git clone https://github.com/simeononsecurity/VirusTotal-PS

# RSAT Offline
cd $tools
git clone https://github.com/simeononsecurity/Offine-PS-ActiveDirectory-Install

# Choco-Hunter or Responder will add on from here 