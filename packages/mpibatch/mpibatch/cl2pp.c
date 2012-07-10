/****************************************************************
cl2pp(1)                                                 cl2pp(1)



NAME
       cl2pp - Command line to parameter file converter.

SYNOPSIS
       cl2pp  targetExe --varName1 varVal1 --varName2 varVal2 ...


DESCRIPTION
       This is a simple command line parser for the UNIX environ-
       ment  which converts command line arguments into the Level
       S style parameter file arguments.  Below is a simple exam-
       ple of the codes use:


       cl2pp cat --five 5 --two 2 --default --hello hola
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

       cl2pp is free software; you can redistribute  them  and/or
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



                           Sept 27 2007                  cl2pp(1)
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
  char execCall[STRLEN] = {0};
  char temp[STRLEN] = {0};
  char paramString[STRLEN] = {0};
  char helperExecName[STRLEN] = {0};
  char targetExec[STRLEN] = {0};
  char argName[STRLEN] = {0};
  char argVal[STRLEN] = {0};

  char *tempPtr;
  int i, returnVal;
  long int pid;
  struct timeval tv;
  struct timezone tz;
  int helperMode;
  
  if( argc < 2 )
  {
    fprintf(stderr, "Usage: %s targetExec --name1 val1 --name2 val2\n\n", argv[0]);
    return(1);
  }
  if( strncmp(argv[1],"--",2) == 0 )
    helperMode = 1;
  else
    helperMode = 0;

  if( !helperMode )
  {
    paramString[0] = '\0';

    strcpy( targetExec, argv[1]);

    for( i = 2; i < argc; i++ )
    {
      sprintf(temp, "%s %s", paramString, argv[i]);
      strcpy(paramString, temp);
    }

    sprintf( execCall, " %s %s | %s -", argv[0], paramString, targetExec );

    returnVal = system(execCall);

    return(returnVal);
  }
  else
  {
    for( i = 1; i < argc; i++ )
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
        fprintf(stdout, "%s = %s\n", argName, argVal);
      }
    }
    fprintf(stdout, "\n\n");

    return(returnVal);
  }
}
