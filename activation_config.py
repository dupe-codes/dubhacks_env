"""
Edits the activate script for a virtualenv to automatically
start the local postgreSQL database, and automatically stop it when
the virtualenv is deactivated.
"""

from subprocess import call


def writeActivationScript():
    current = open('activate', 'r')
    temp = open('activate_temp', 'w')
    filelines = current.readlines()

    for line in filelines:
        temp.write(line)
        if "deactivate ()" in line:
            writeCloseDB(temp)

    current.close()
    writeStartDB(temp)

    # Now replace automatically created activate script with our new one
    call(["sudo", "rm", "activate"])
    call(["sudo", "mv", "activate_temp", "activate"])

def writeCloseDB(file):
    file.write('\t# Close down database server, if its running\n')
    file.write('\tif [ -n "$SERVER_RUNNING" ] ; then\n')
    file.write('\t\tpg_ctl -D /usr/local/var/postgres stop -s -m fast\n')
    file.write('\t\tunset SERVER_RUNNING\n')
    file.write("\t\techo 'Server closed down, development environment shut down.'\n")
    file.write('\tfi\n\n')

def writeStartDB(file):
    file.write('\n# Start up the database server\n')
    file.write("echo 'Starting development server...'\n")
    file.write('pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start\n')
    file.write('SERVER_RUNNING=True\n')
    file.write("echo 'Server started, development environment configured.'\n")

if __name__ == '__main__':
    print "Configuring virtualenv..."
    writeActivationScript()
    print "Done, virtualenv configured."
