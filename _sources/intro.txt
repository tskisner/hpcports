
.. _intro:

Introduction
===============

This set of tools is "inspired" by the FreeBSD Ports and Macports systems and is intended to provide an easy way to install packages on High Performance Computing (HPC) systems.  Porting software to an HPC environment can be much more challenging than installation on a personal computer for several reasons:

* Lack of root access to these systems.
* Many HPC systems have heavily customized userspace tools and compiler toolchains.
* In many cases, "standard" tools that come with the OS are horribly out of date or compiled with a different compiler which is not compatible with the one we would like to use.
* In the case of systems with static compilation, updating a low-level package requires rebuilding all dependent higher-level packages.
* When performing expensive production runs, reproducibility is important and it is critical to track all versions of all software that went into the job.

HPCPorts was designed to make it tractable to manage the installation of hundreds of open source software packages while preserving previous versions and their dependencies.
