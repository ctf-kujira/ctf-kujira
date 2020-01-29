import os
import sys
import yaml


def get_rc_path():
    # get '.bashrc' or '.zshrc'
    home = os.path.expanduser('~')

    shell = os.environ['SHELL']
    shell = shell.split('/')[-1]

    return f'{home}/.{shell}rc'


def generate_command():
    # get name
    current_dir = os.getcwd()
    command_name = current_dir.split('/')[-1]

    # get name
    command = f'''
    alias {command_name}=" \
    cd {current_dir}/volume \
    && docker-compose up"
    '''.replace('  ', '')

    return command
