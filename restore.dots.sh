#!/bin/bash

cp -f .bashrc ~/.bashrc
cp -f .gitconfig ~/.gitconfig
cp -f .toprc ~/.toprc
cp -f .nanorc ~/.nanorc
cp -Rf .nano ~/.nano
cp -f .emacs ~/.emacs
cp -Rf .emacs.d ~/.emacs.d

echo -n "Password: "
read -s password
password_enc=`echo -n ${password} | sha512sum | cut -d' ' -f1`
#Don't even bother... SHA-512 encrypted
if [ "$password_enc" == "62c66f5fda514e5529e9ac90604b827173dcf53148229f519ae5e3e35facf3e92f754b3357017116fcfd5e2f7e5d7f84862d78d4796ff776069c34de00095234" ]; then
  mkdir -p ~/.ssh
  rm -f ~/.ssh/id_rsa ~/.ssh/id_rsa.pub
  cp ./.ssh/id_rsa.pub ~/.ssh/id_rsa.pub
  openssl enc -d -aes-256-cbc -in ./.ssh/id_rsa.aes256 -out ~/.ssh/id_rsa -pass pass:$password
  chmod 400 ~/.ssh/id_rsa*
  echo ""
else
  echo "Wrong password!"
fi