#include <stdlib.h>
#include <registryFunction.h>
#include <aSubRecord.h>
#include <epicsExport.h>
#include <menuFtype.h>
#include <errlog.h>
#include <stdio.h>

static long forcecrash(aSubRecord *prec)
{
    if (prec->fta != menuFtypeLONG)
    {
        errlogSevPrintf(errlogMajor, "%s incorrect argument type A", prec->name);
        printf(prec->fta);
        return 1;
    }

    if ( *(long*)prec->a == 1){
        // Purposefully cause a segfault
        *(int*)0 = 0;
    }

    return 0;
}

epicsRegisterFunction(forcecrash);