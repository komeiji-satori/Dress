#!/bin/bash
cp deploy/id_rsa ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
eval $(ssh-agent)
ssh-add ~/.ssh/id_rsa
cp deploy/ssh_config ~/.ssh/config
git config --global user.name 'dressRelease'
git config --global user.email 'dress@release.com'
git clone git@github.com:dressRelease/dressRelease.github.io.git --depth 1
cp -rf dist/dress dressRelease
cd dressRelease
git add --all
git commit -m \"Update\"
git push origin HEAD:master --force
cd ..