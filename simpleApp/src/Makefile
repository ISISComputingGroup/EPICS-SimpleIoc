TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = simple
# simple.dbd will be created and installed
DBD += simple.dbd

# simple.dbd will be made up from these files:
simple_DBD += base.dbd

# Include dbd files from all support applications:
simple_DBD += devIocStats.dbd
simple_DBD += pvdump.dbd 
simple_DBD += caPutLog.dbd 
simple_DBD += timestampRecord.dbd
simple_DBD += cvtRecord.dbd

# Add all the support libraries needed by this IOC
simple_LIBS += devIocStats 
simple_LIBS += pvdump easySQLite sqlite 
simple_LIBS += caPutLog
simple_LIBS += timestampRecord
simple_LIBS += cvtRecord csmbase

# simple_registerRecordDeviceDriver.cpp derives from simple.dbd
simple_SRCS += simple_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
simple_SRCS_DEFAULT += simpleMain.cpp
simple_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#simple_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
simple_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

