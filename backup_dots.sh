#!/bin/bash

cp -f ~/.bashrc .bashrc
cp -f ~/.gitconfig .gitconfig
cp -f ~/.toprc .toprc

cp -f ~/.vimrc .vimrc
cp -f ~/.vimfs .vimfs
cp -Rf ~/.vim .

echo -n "Password: "
read -s password
password_enc=`echo -n ${password} | sha512sum | cut -d' ' -f1`
#Don't even bother... SHA-512 encrypted
if [ "$password_enc" == "62c66f5fda514e5529e9ac90604b827173dcf53148229f519ae5e3e35facf3e92f754b3357017116fcfd5e2f7e5d7f84862d78d4796ff776069c34de00095234" ]; then
  mkdir -p .ssh
  cp ~/.ssh/id_rsa.pub ./.ssh/
  openssl enc -aes-256-cbc -in ~/.ssh/id_rsa -out ./.ssh/id_rsa.aes256 -pass pass:$password
  echo ""
else
  echo "Wrong password!"
fi