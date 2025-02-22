# run using your shell of choice
#
echo "Getting new GPG key"

wget https://archive.kali.org/archive-key.asc > $HOME/archive-key.asc 

gpg --no-default-keyring --keyring $HOME/temp.gpg --import $HOME/archive-key.asc

gpg --no-default-keyring --keyring $HOME/temp.gpg --export --object $HOME/archive-key.asc

sudo mv $HOME/archive-key.asc /etc/apt/keyrings/archive-key.asc
rm $HOME/archive-key.asc
rm $HOME/temp.gpg

sudo rm /etc/apt/sources.list

echo "deb [signed-by=/etc/apt/keyrings/archive-key.asc]  http://http.kali.org/kali kali-rolling main contrib non-free" | sudo tee /etc/apt/sources.list.d/sources.list
