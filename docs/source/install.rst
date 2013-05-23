
.. _install:

Installation
==================================

HPCPorts consists entirely of interpreted code, so there is nothing to "install".  Essentially you just clone the git repository and then optionally update your shell path so that you can run the hpcp command from anywhere.

#. First clone the repo::

	$> git clone git://github.com/tskisner/hpcports.git

#. You can now change into that hpcports directory and run::

	$> ./hpcp status

but that is not always so convenient.  Suppose that you ran the clone command above in your home directory, and that you now have the folder /home/user/hpcports.  You can add that directory to your shell's PATH variable.  For example, put the following lines in ~/.bashrc::

	# for access to the hpcp command
	export PATH=${PATH}:/home/user/hpcports

From a new shell, you can now do::

	$> hpcp status

No matter what directory you are currently in.


