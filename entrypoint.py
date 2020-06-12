import sys
import os
from subprocess import check_call


assert len(sys.argv) == 4, 'please call oats-docker $HOME $USER $UID'
home, user, uid = sys.argv[1:4]
os.makedirs(home, exist_ok=True)
check_call(['useradd',
            '-md', home, user,
            '-p', 'cSgSiul0b/PbA',  # password 'pass'
            '-s', '/bin/bash',
            '-u', uid])
check_call(['addgroup', user, 'sudo'])
check_call(['addgroup', user, 'docker'])
check_call(['chown', user, '/var/run/docker.sock'])

os.execv('/usr/bin/supervisord', ['/usr/bin/supervisord'])