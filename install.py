#!/usr/bin/python

import os, sys

# set variable
VOLUME = 'volume'
FOLDER = '.ctf-kujira'
KUJIRA = 'kujira'
HOME = os.path.expanduser('~')
KUJIRA_DIRECTORY_PATH = HOME + '/' + FOLDER
KUJIRA_PATH = KUJIRA_DIRECTORY_PATH + '/' + KUJIRA

# clone ctf-kujira
os.chdir(HOME)
cmd = 'git clone https://github.com/akakou/ctf-kujira/ {}'.format(FOLDER)
os.system(cmd)

# make volume folder
cmd = 'mkdir {0}/{1}'.format(KUJIRA_DIRECTORY_PATH, VOLUME)
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

# set permission
cmd = 'sudo chmod +x {0}'.format(KUJIRA_PATH)
os.system(cmd)

# set alias(command)
f = open(shellrc_path, 'a')
alias = 'alias kujira=\'{0}\''.format(KUJIRA_PATH)
f.write(alias)
f.close()

# restart shell
os.system(shell)

