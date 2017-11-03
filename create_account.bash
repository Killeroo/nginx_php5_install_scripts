# Load config file
source $PWD/setup.cnf

# Create account
sudo adduser --system --home /home/$account_name --disabled-password --shell /bin/bash $account_name
(echo $account_password; echo $account_password; ) | sudo passwd $account_name
sudo usermod -aG sudo $account_name