#!../../bin/windows-x64/simple

## You may have to change simple to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/simple.dbd"
simple_registerRecordDeviceDriver pdbbase

< $(IOCSTARTUP)/init.cmd

## Load record instances

< $(IOCSTARTUP)/dbload.cmd

dbLoadRecords("db/simple.db","P=$(MYPVPREFIX)SIMPLE:")
dbLoadRecords("db/channel_access_test.db","P=$(MYPVPREFIX)SIMPLE:")

< $(IOCSTARTUP)/preiocinit.cmd

cd ${TOP}/iocBoot/${IOC}
iocInit

< $(IOCSTARTUP)/postiocinit.cmd
