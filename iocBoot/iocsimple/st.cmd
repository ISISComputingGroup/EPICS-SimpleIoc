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

## db's to test macro defaults, dbload failures on these can be freely ignored.
dbLoadRecords("db/simple_macrotest1.db","P=$(MYPVPREFIX)SIMPLE:,MACRO1=$(MACRO1)")
dbLoadRecords("db/simple_macrotest2.db","P=$(MYPVPREFIX)SIMPLE:,MACRO2=$(MACRO2)")
dbLoadRecords("db/simple_macrotest3.db","P=$(MYPVPREFIX)SIMPLE:,MACRO3=$(MACRO3)")


< $(IOCSTARTUP)/preiocinit.cmd

cd ${TOP}/iocBoot/${IOC}
iocInit

< $(IOCSTARTUP)/postiocinit.cmd
