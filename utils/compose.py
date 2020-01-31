import os
from utils.common import get_file_path


def up():
    '''$ docker-compose up'''
    path = get_file_path('')
    os.system(f'cd {path} && docker-compose up')


def run(args):
    '''$ docker-compose run'''
    path = get_file_path('')
    os.system(f'cd {path} && docker-compose run {args}')
