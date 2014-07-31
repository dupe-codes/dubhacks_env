Development Tools
=================

Virtual Environment Setup Script
--------------------------------
This simple script sets up a virtualenv development environment, complete with a properly
configured python path, to be used when working on the data-pipeline source code

To set up the environment, navigate to the parent directory of your data-pipeline/ directory.
From there, say:
`git clone https://github.com/DupSteGu-Enterprises/dev-setup-tools.git`

Now, cd into dev-setup-tools/ and give the necessary permissions for the virtualenv_setup script to run:
`chmod 700 virtualenv_setup.sh`

You should now be able to run the setup script by saying:
`./virtualenv_setup.sh`

Hopefully everything goes smoothly!  

NOTE: The script is pretty hacky and makes lots of assumptions about where it is in
your filesystem realtive to the data-pipeline project. Be sure to follow the above instructions
thoroughly, or face certain error.
