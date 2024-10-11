#ifdef _WIN32
#include <windows.h>
#else
#include <unistd.h>
#endif /* _WIN32 */
#include <stdlib.h>
#include <registryFunction.h>
#include <aSubRecord.h>
#include <epicsExport.h>
#include <menuFtype.h>
#include <errlog.h>
#include <stdio.h>

static long forcecrash(aSubRecord *prec)
{
    // Make a pointer to an invalid address 0
    int* ptr = 0;

    if (prec->fta != menuFtypeLONG)
    {
        errlogSevPrintf(errlogMajor, "%s incorrect argument type A", prec->name);
        printf("%d", prec->fta);
        return 1;
    }

    if ( *(long*)prec->a == 1){
        // Purposefully cause a segfault by writing to invalid memory address 0
        //*ptr = 0;
        // above can cause a debugger to appear, so exit process for same effect
#ifdef _WIN32
        //ExitProcess(1); // This now seems to hang ioc and not exit
        TerminateProcess(GetCurrentProcess(), 1);
#else
        _exit(1);
#endif /* _WIN32 */
    }

    return 0;
}

epicsRegisterFunction(forcecrash);
