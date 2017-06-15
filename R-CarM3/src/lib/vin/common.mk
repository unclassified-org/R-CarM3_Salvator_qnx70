ifndef QCONFIG
QCONFIG=qconfig.mk
endif
include $(QCONFIG)

include $(MKFILES_ROOT)/qmacros.mk
-include $(PROJECT_ROOT)/roots.mk
#####AUTO-GENERATED by packaging script... do not checkin#####
   INSTALL_ROOT_nto = $(PROJECT_ROOT)/../../../install
   USE_INSTALL_ROOT=1
##############################################################
define PINFO
PINFO DESCRIPTION=VIN libraries
endef

EXTRA_SILENT_VARIANTS = $(subst -, ,$(SECTION))
NAME =$(SECTION)

USEFILE = $(PROJECT_ROOT)/Usemsg
#########################################################
# Make sure the build environment is configured properly
#########################################################
include $(MKFILES_ROOT)/qtargets.mk
##########################################################
# Install our binaries/headers into the CPP shared folder
##########################################################

LIBS += dma-rcar-audioppdmacS rcar-imrS

EXTRA_INCVPATH += $(INSTALL_ROOT_nto)/usr/include
EXTRA_INCVPATH += $(INSTALL_ROOT_nto)/usr/include/hw
EXTRA_INCVPATH += $(PROJECT_ROOT)/common
EXTRA_INCVPATH += $(PROJECT_ROOT)/../../../src/hardware/wfd/common
