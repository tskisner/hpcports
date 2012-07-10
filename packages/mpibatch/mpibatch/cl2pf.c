/****************************************************************
cl2pf(1)                                                 cl2pf(1)



NAME
       cl2pf - Command line to parameter file converter.

SYNOPSIS
       cl2pf  targetExe --varName1 varVal1 --varName2 varVal2 ...


DESCRIPTION
       This is a simple command line parser for the UNIX environ-
       ment  which converts command line arguments into the Level
       S style parameter file arguments.  Below is a simple exam-
       ple of the codes use:


       cl2pf cat --five 5 --two 2 --default --hello hola
       five = 5
       two = 2
       default =
       hello = hola

       In  this  example  the target executable is cat.  The code
       creates a parameter file, calls the target executable fol-
       lowed  by the name of parameter file, and then deletes the
       file that it created.  The temporary file is named as fol-
       lows:

        .hostname_PID_seconds_microseconds.par

       Where hostname is the hostname of the computer, PID is the
       process identification number, and the  last  two  entries
       are  the  time  since  1970  in  seconds and microseconds.
       Notice that the file starts with a period, so it will  not
       be  listed  without  the  -a  option.   The  file  name is
       intended to be unique.


COPYRIGHT
       Copyright (C) 2003  Christopher M. Cantalupo

       cl2pf is free software; you can redistribute  them  and/or
       modify  them  under  the  terms  of the GNU General Public
       License as published  by  the  Free  Software  Foundation;
       either  version  2 of the License, or (at your option) any
       later version.

       This program is distributed in the hope that  it  will  be
       useful, but WITHOUT ANY WARRANTY; without even the implied
       warranty of MERCHANTABILITY or FITNESS  FOR  A  PARTICULAR
       PURPOSE.   See  the  GNU  General  Public License for more
       details.

       Christopher Cantalupo <cmc@nersc.gov>

       Send bug reports or comments to the above address.



                           May 15 2003                   cl2pf(1)
****************************************************************/

#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/time.h>
#include <unistd.h>
#include <string.h>

#define STRLEN 8192

int main( int argc, char **argv )
{
  char execCall[10*STRLEN] = {0};
  char execName[STRLEN] = {0};
  char argName[STRLEN] = {0};
  char argVal[STRLEN] = {0};
  char paramFileName[10*STRLEN] = {0};
  char myHostname[STRLEN] = {0};
  int i, returnVal;
  long int pid;
  struct timeval tv;
  struct timezone tz;
  FILE *paramFile;
  
  if( argc < 2 )
  {
    fprintf(stderr, "Usage: %s targetExe --name1 val1 --name2 val2\n\n", argv[0]);
    return(1);
  }


  /* Make a unique parameter file name using the host name, process ID, and time */
  myHostname[STRLEN-1] = 0;
  gethostname(myHostname, STRLEN-1);
  pid = (long int)getpid();  
  gettimeofday(&tv, &tz);
  sprintf(paramFileName, ".%s_%li_%li_%li.par", myHostname, pid, tv.tv_sec, tv.tv_usec);

  paramFile = fopen(paramFileName, "w");
  if( !paramFile )
  {
    fprintf(stderr, "ERROR: Could not open temporary file named %s for writing\n\n", paramFileName );
    return(1);
  }

  strcpy(execName, argv[1]);

  for( i = 2; i < argc; i++ )
  {
    if( !strncmp(argv[i], "--", 2) )
    {
      strcpy(argName, argv[i] + 2);
      if( i+1 < argc && strncmp( argv[i+1], "--", 2) )
      {
        i++;
        strcpy(argVal, argv[i]);
      }
      else
        argVal[0] = 0;
      fprintf(paramFile, "%s = %s\n", argName, argVal);
    }
  }
  fprintf(paramFile, "\n\n");
  fclose(paramFile);

  sprintf(execCall, "%s %s", execName, paramFileName);
  returnVal = system(execCall);
  unlink(paramFileName);

  return(returnVal);
}
