BEFORE YOU INSTALL
------------------

You will need a current version of Genesis to use ColdCore-3.0.1999-08-28.
Information on getting the latest Genesis can be found at:

    http://www.cold.org/Software/Genesis/

INSTALLING
----------

Once you have Genesis compiled, locate the programs 'coldcc' and
'genesis' (created from the Genesis distribution) and move them to
the 'bin' directory.  Then type::

       bin/coldcc -tcoldcore

If there are no problems, the above two command will compile the
'coldcore' file into a binary database.

The base directories genesis prefers (see the Genesis Documentation
for full details), exist as::

      dbbin/       -- directory where programs can be placed
                      for execution from the database
      logs/        -- where logfiles go
      backups/     -- backup files, created by dbbin/backup
      root/        -- root directory for db file operations
      bin/         -- binary location for other programs

STARTING FOR THE FIRST TIME
---------------------------

The first people to create accounts will be creating administrative
accounts, and will be placed into a configuration subsystem.  Therefore,
it is in your best interest to start the server and connect alone
first, then after you finish the configuration you can invite others
to connect.

You can start your server at any time by typing::

       bin/genesis

This will create a daemon process in the background.  You can now
connect to your server through port 1138, or on the web through
port 1180.

Once you connect to port 1138, you can type 'Help' for a list of
commands available at the login screen.  You will want to use the
command 'create' to create a new user.  By default all new users
are created with administrator priviledges--and a configuration
system is also run at the same time, so be sure to do this before
inviting other people onto your server.

SUPPORT THE COLD PROJECT
------------------------

You can learn more about helping to support the Cold Project at:

    http://www.cold.org/support/

