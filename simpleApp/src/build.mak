TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = $(APPNAME)
# simple.dbd will be created and installed
DBD += $(APPNAME).dbd

# simple.dbd will be made up from these files:
simple_DBD += base.dbd

# Include dbd files from all support applications:
simple_DBD += devIocStats.dbd
simple_DBD += pvdump.dbd 
simple_DBD += caPutLog.dbd 
simple_DBD += cvtRecord.dbd
simple_DBD += icpconfig.dbd
simple_DBD += asSupport.dbd
simple_DBD += pvcomplete.dbd
simple_DBD += busySupport.dbd
simple_DBD += utilities.dbd
simple_DBD += stdSupport.dbd
simple_DBD += calcSupport.dbd
simple_DBD += asubFunctions.dbd
simple_DBD += randdev.dbd
simple_DBD += asyn.dbd
simple_DBD += forcecrash.dbd

# Add all the support libraries needed by this IOC
simple_LIBS += devIocStats 
simple_LIBS += pvdump $(MYSQLLIB) easySQLite sqlite 
simple_LIBS += caPutLog
simple_LIBS += cvtRecord csmbase
simple_LIBS += icpconfig pugixml
simple_LIBS += autosave
simple_LIBS += utilities pcrecpp pcre
simple_LIBS += pvcomplete
simple_LIBS += std
simple_LIBS += calc
simple_LIBS += sscan
simple_LIBS += asubFunctions
simple_LIBS += busy asyn
simple_LIBS += seq pv

# simple_registerRecordDeviceDriver.cpp derives from simple.dbd
simple_SRCS += simple_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
simple_SRCS_DEFAULT += simpleMain.cpp
simple_SRCS_vxWorks += -nil-

simple_SRCS += devRand.c
simple_SRCS += devRandAsync.c
simple_SRCS += forcecrash.c

# Add support from base/src/vxWorks if needed
#simple_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

## area detector already includes PVA, so avoid including it twice
ifeq ($(AREA_DETECTOR),)
include $(CONFIG)/CONFIG_PVA_ISIS
endif

# Finally link to the EPICS Base libraries
simple_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

