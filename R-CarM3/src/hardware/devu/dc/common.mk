ifndef QCONFIG
QCONFIG=qconfig.mk
endif
include $(QCONFIG)

#LIB_VARIANT = $(patsubst dll.,dll,$(subst $(space),.,so $(filter wcc be le,$(VARIANTS))))

EXTRA_CCDEPS = $(wildcard $(PROJECT_ROOT)/*.h $(PRODUCT_ROOT)/public/sys/io-usb_dcd.h )

LDFLAGS +=

#EXTRA_INCVPATH = $(PROJECT_ROOT)/../../../services/usb/public $(PROJECT_ROOT)/../../../services/usb
EXTRA_INCVPATH += $(PROJECT_ROOT)/../../../lib/usbdci/public $(PROJECT_ROOT)/../include
EXTRA_INCVPATH += $(PROJECT_ROOT)/../../../services/usb_dcd/public
EXTRA_INCVPATH += $(PROJECT_ROOT)/private

include $(MKFILES_ROOT)/qmacros.mk

TYPE = $(firstword $(filter a o dll, $(VARIANTS)) o)

ifndef PROTOCOL
	PROTOCOL = $(firstword $(filter usbrndis usbser usbser2 usbumass usbeem dummy, $(VARIANTS)))
endif
EXTRA_SILENT_VARIANTS += blank

NAME = devu

#USEFILE_a =
#USEFILE_o = $(SECTION_ROOT)/$(NAME)-$(SECTION).use
USEFILE_dll = $(SECTION_ROOT)/$(PROTOCOL)/$(NAME)-$(PROTOCOL)-$(SECTION).use
USEFILE   = $(USEFILE_$(TYPE))

CCFLAGS_o =
CCFLAGS_a = -Dmain=main_$(SECTION)
CCFLAGS  += $(CCFLAGS_$(TYPE))
CCFLAGS  += $(CCFLAGS_$(BOARD))
CCFLAGS_msm8960 += -fno-strict-aliasing

define PINFO
PINFO DESCRIPTION=
endef

-include $(SECTION_ROOT)/override.mk
-include $(SECTION_ROOT)/pinfo.mk


#####AUTO-GENERATED by packaging script... do not checkin#####
   INSTALL_ROOT_nto = $(PROJECT_ROOT)/../../../../install
   USE_INSTALL_ROOT=1
##############################################################

include $(MKFILES_ROOT)/qtargets.mk

-include $(PROJECT_ROOT)/roots.mk
