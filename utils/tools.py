import os
import utils.common import get_file_path


def launch():
    '''Launch docker-compose.'''
    path = get_file_path('')
    os.system(f'cd {path} && docker-compose up')
