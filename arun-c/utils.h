#ifndef _UTILS_H_
#define _UTILS_H_
/*----------------------------------------------------------------------*\

    utils.h

    Utility functions for the Alan interpreter

\*----------------------------------------------------------------------*/

/* IMPORTS: */
#include "types.h"


/* TYPES: */


/* FUNCTIONS: */
extern void terminate(int code);
extern void usage(char *programName);
extern void printVersion(int buildNumber);
extern void printIFIDs(char *adventureName);
extern bool match(char *pattern, char *input);

#endif
