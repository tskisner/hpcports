#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "mpi.h"

#define COMMAND_LENGTH 8192


int main( int argc, char **argv )
{
  int i, myRank, numProc, numCommands, status;
  char stdoutFileName[256];
  char *tempPtr;
  char commandLine[COMMAND_LENGTH] = {0};
  char thisCommandLine[COMMAND_LENGTH] = {0};
  FILE *commandListFile;
  MPI_Status theStatus;

  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD,&myRank);
  MPI_Comm_size(MPI_COMM_WORLD,&numProc);

  if( argc < 1 )
  {
    fprintf(stderr, "Usage:  %s commandListFile\n\n", argv[0]);
    MPI_Abort(MPI_COMM_WORLD, 1);
    return(1);
  }

  if( myRank == 0 )
  {
    commandListFile = fopen(argv[1], "r");
    if( !commandListFile )
    {
      fprintf(stderr, "ERROR: Could not open file called %s", argv[1]);
      MPI_Abort(MPI_COMM_WORLD, 1);
      return(1);
    }

    *commandLine = 0;
    while(!feof(commandListFile) && ( *commandLine == 0 || *commandLine == '#' || *commandLine == '\n' ) )
      fgets(commandLine, COMMAND_LENGTH, commandListFile);

    numCommands = 1;

    while(!feof(commandListFile) && numCommands < numProc)
    {
      *thisCommandLine = 0;
      fgets(thisCommandLine, COMMAND_LENGTH, commandListFile);
      if( *thisCommandLine && *thisCommandLine != '#' && *thisCommandLine != '\n')
      {
        MPI_Send(thisCommandLine, COMMAND_LENGTH, MPI_CHAR, numCommands, 0, MPI_COMM_WORLD);
        numCommands++;
      }
    }
    if( feof(commandListFile) && numCommands < numProc )
    {
      fprintf(stderr, "WARNING:  More MPI tasks than commands, some processors will be idle\n\n");
      *thisCommandLine = 0;
      for( i = numCommands; i < numProc; i++ )
        MPI_Send(thisCommandLine, COMMAND_LENGTH, MPI_CHAR, i, 0, MPI_COMM_WORLD);
    }
    fclose(commandListFile);
  }
  else
    MPI_Recv(commandLine, COMMAND_LENGTH, MPI_CHAR, 0, 0, MPI_COMM_WORLD, &theStatus );

  if( *commandLine )
  {
    tempPtr = strrchr(argv[1], '/');
    if(tempPtr)
      tempPtr = tempPtr + 1;
    else
      tempPtr = argv[1];
    sprintf(stdoutFileName, "%s_%i.log", tempPtr, myRank);
    if( getenv("MPI_BATCH_NO_STDOUT") ||
        ( getenv("MPI_BATCH_NO_STDOUT_BUT_ROOT") && myRank ) ) 
      freopen("/dev/null", "w", stdout);
    else
      freopen(stdoutFileName, "w", stdout);
    status = system(commandLine);
    if( status )
    {
      fprintf(stderr, "Error:  Call to system failed on processor %i\n", myRank);
      fprintf(stderr, "        status = %i\n", status );
      fprintf(stderr, "        command issued:\n" );
      fprintf(stderr, "%s\n", commandLine);
    }
  }

  MPI_Barrier(MPI_COMM_WORLD);
  MPI_Finalize();
}
  




















