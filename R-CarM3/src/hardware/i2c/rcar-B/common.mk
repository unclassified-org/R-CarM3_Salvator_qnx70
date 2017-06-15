ifndef QCONFIG
QCONFIG=qconfig.mk
endif
include $(QCONFIG)

include $(MKFILES_ROOT)/qmacros.mk

-include $(PROJECT_ROOT)/roots.mk

define PINFO
PINFO DESCRIPTION=R-CarH2 I2C protocol driver
endef

NAME := i2c-$(NAME)
USEFILE = $(PROJECT_ROOT)/Usemsg
INSTALLDIR = sbin
LIBS = i2c-master

EXTRA_LIBVPATH += $(PROJECT_ROOT)/../../../install/armle-v7/usr/lib


#####AUTO-GENERATED by packaging script... do not checkin#####
   INSTALL_ROOT_nto = $(PROJECT_ROOT)/../../../../install
   USE_INSTALL_ROOT=1
##############################################################

include $(MKFILES_ROOT)/qtargets.mk


