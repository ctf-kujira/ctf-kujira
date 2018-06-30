#!/usr/bin/python

import os, sys


# get input
while True:
    i = input('Would you remove all files and folders under ./.ctf-kujira ?(y/n):')
    if i == 'y' or i == 'Y':
        break
    elif i == 'n' or i == 'N':
        exit()

# set variable
VOLUME = 'volume'
FOLDER = '.ctf-kujira'
KUJIRA = 'kujira'
HOME = os.path.expanduser('~')
KUJIRA_DIRECTORY_PATH = HOME + '/' + FOLDER
KUJIRA_PATH = KUJIRA_DIRECTORY_PATH + '/' + KUJIRA

# remove files and folders
cmd = 'sudo rm -rf {0}'.format(KUJIRA_DIRECTORY_PATH)
os.system(cmd)

# get shell's rc file name
shell = os.environ['SHELL']
if shell == '/bin/zsh':
    shellrc_path = HOME + '/.zshrc'
elif shell == '/bin/bash':
    shellrc_path = HOME + '/.bashrc'
else:
    sys.stderr.write('shell not supported => {}'.format(shell))
    exit()

# remove alias(command)
f = open(shellrc_path, 'r')
body = f.read()
f.close()

alias = '\nalias kujira=\'{0}\''.format(KUJIRA_PATH)
body = body.replace(alias, '')

f = open(shellrc_path, 'w')
f.write(body)
f.close()

# restart shell
os.system(shell)

