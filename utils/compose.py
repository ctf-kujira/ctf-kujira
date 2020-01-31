import os
from utils.common import get_file_path


def up():
    '''Launch docker-compose.'''
    path = get_file_path('')
    os.system(f'cd {path} && docker-compose up')
