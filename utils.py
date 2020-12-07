import os
import sys
import pathlib
import yaml


def get_rc_path():
    '''Get '.bashrc' or '.zshrc.'''
    home = os.path.expanduser('~')

    shell = os.environ['SHELL']
    shell = shell.split('/')[-1]

    return f'{home}/.{shell}rc'


def get_file_path(filename):
    '''Get ./run path.'''
    abslib = os.path.abspath(__file__)
    directory_path = pathlib.Path(abslib).parent
    file_path = f'{directory_path}/{filename}'
    return file_path


def generate_command():
    '''Generate the command.'''
    # get name
    current_dir = os.getcwd()
    command_name = current_dir.split('/')[-1]

    # get name
    run_path = get_file_path('run')
    command = f'alias {command_name}="{run_path}"\n'.replace('  ', '')

    return command
