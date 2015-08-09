#!/usr/bin/env sh

######
#
# A shell script for
# installing ATS2 + ATS2-contrib
#
######
#
# The URL for this script: http://git.io/vIFPF
#
######
#
# Author: Hongwei Xi
# Authoremail: gmhwxiATgmailDOTcom
#
######

sudo apt-get update
#
# Installing gcc
# sudo apt-get install -y gcc
# Installing git
# sudo apt-get install -y git
#
sudo apt-get install -y build-essential
sudo apt-get install -y libgmp-dev libgc-dev

######

git clone git://git.code.sf.net/p/ats2-lang/code ATS2
git clone https://github.com/githwxi/ATS-Postiats-contrib.git ATS2-contrib

######

export PATSHOME=${PWD}/ATS2
export PATSHOMERELOC=${PWD}/ATS2-contrib

######
#
export PATH=${PATSHOME}/bin:${PATH}
#
######

echo "export PATSHOME=${PWD}/ATS2" >> ${HOME}/.bashrc
echo "export PATSHOMERELOC=${PWD}/ATS2-contrib" >> ${HOME}/.bashrc
echo "export PATH=\${PATSHOME}/bin:\${PATH}" >> ${HOME}/.bashrc

######
#
# Building patsopt + patscc
#
(cd ATS2 && ./configure)
(cd ATS2 && time make all)
#
######
#
# Installing patscc and patsopt
#
# (cd ATS2 && sudo make install)
#
######

sudo apt-get install -y libjson-c-dev

######
#
# Building patsolve_z3
#
(cd ATS2-contrib/projects/MEDIUM/ATS-extsolve && time make DATS_C)
(cd ATS2-contrib/projects/MEDIUM/ATS-extsolve-z3 && time make build && mv -f patsolve_z3 ${PATSHOME}/bin)
#
######
#
# Building atscc2js
# Building atscc2erl
# Building atscc2php
#
(cd ATS2-contrib/projects/MEDIUM/CATS-parsemit && time make DATS_C)
(cd ATS2-contrib/projects/MEDIUM/CATS-atsccomp/CATS-atscc2js && time make build && mv -f atscc2js ${PATSHOME}/bin)
(cd ATS2-contrib/projects/MEDIUM/CATS-atsccomp/CATS-atscc2erl && time make build && mv -f atscc2erl ${PATSHOME}/bin)
(cd ATS2-contrib/projects/MEDIUM/CATS-atsccomp/CATS-atscc2php && time make build && mv -f atscc2php ${PATSHOME}/bin)
#
######
#
###### end of [C9-ATS2-install.sh] ######