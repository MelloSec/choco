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

# Tools
mkdir C:\Tools
cd C:\Tools

# Fireprox
git clone https://github.com/ustayready/fireprox
cd fireprox
virtualenv -p python3 .
# source bin/activate
pip install -r requirements.txt
python fire.py