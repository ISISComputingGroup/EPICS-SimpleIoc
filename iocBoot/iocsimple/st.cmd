#!../../bin/windows-x64/simple

## You may have to change simple to something else
## everywhere it appears in this file

< envPaths

epicsEnvSet "IOCNAME" "$(P=$(MYPVPREFIX))SIMPLE"
epicsEnvSet "IOCSTATS_DB" "$(DEVIOCSTATS)/db/iocAdminSoft.db"

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/simple.dbd"
simple_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadRecords("db/simple.db","P=$(IOCNAME):")

dbLoadRecords("$(TIMESTAMPRECORD)/db/timestamp.db","P=$(IOCNAME):")

dbLoadRecords("$(IOCSTATS_DB)","IOC=$(IOCNAME)")

pvdump("../pvdump/PV_data.db", "$(IOCNAME):")

cd ${TOP}/iocBoot/${IOC}
iocInit

