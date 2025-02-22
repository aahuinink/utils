# run using your shell of choice
#
echo "Getting new GPG key"

wget https://archive.kali.org/archive-key.asc > archive-key.asc 
 
gpg --no-default-keyring --keyring ./temp.gpg --import ./archive-key.asc

gpg --no-default-keyring --keyring ./temp.gpg --export -o /etc/apt/keyrings/archive-key.asc

rm temp.gpg

rm /etc/apt/sources.list

echo "deb [signed-by=/etc/apt/keyrings/archive-key.asc]  http://http.kali.org/kali kali-rolling main contrib non-free" | tee /etc/apt/sources.list.d/sources.list
