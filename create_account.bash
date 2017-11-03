
# Fetch username and password from setup.conf
username=$(bash $PWD/query_config_file.bash username)
password=$(bash $PWD/query_config_file.bash password)

# Create account
sudo adduser --system --home /home/$user --disabled-password --shell /bin/bash $user
(echo $password; echo $password; ) | sudo passwd $user
sudo usermod -aG sudo $user