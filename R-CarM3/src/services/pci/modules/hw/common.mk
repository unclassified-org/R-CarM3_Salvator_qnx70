ifndef QCONFIG
QCONFIG=qconfig.mk
endif
include $(QCONFIG)

NAME=pci_hw
INSTALLDIR=lib/dll/pci/
USEFILE=$(PROJECT_ROOT)/$(SECTION)/$(SECTION).use

ENDIAN=$(filter le be, $(VARIANT_LIST))
#ENDIAN=$(patsubst %e,-%e,$(END))

EXTRA_INCVPATH+=$(PROJECT_ROOT)/../../../../lib/pci/public
EXTRA_INCVPATH+=$(PROJECT_ROOT)/../../../../lib/pci
EXTRA_INCVPATH+=$(PROJECT_ROOT)/../../modules/capabilities/public
EXTRA_INCVPATH+=$(PROJECT_ROOT)/../../modules/capabilities
EXTRA_INCVPATH+=$(PROJECT_ROOT)/../../modules/slog
EXTRA_INCVPATH+=$(PROJECT_ROOT)/../../modules/debug
EXTRA_INCVPATH+=$(PROJECT_ROOT)/../../server

EXTRA_SRCVPATH+=$(PROJECT_ROOT)/../_common/
EXTRA_SRCVPATH+=$(PROJECT_ROOT)/src/
EXTRA_SRCVPATH+=$(PROJECT_ROOT)/src/parse
EXTRA_SRCVPATH+=$(PROJECT_ROOT)/src/rsrcdb
EXTRA_SRCVPATH+=$(PROJECT_ROOT)/src/syspage

EXTRA_LIBVPATH+=$(PROJECT_ROOT)/../../../../lib/pci/so/$(CPU)/$(ENDIAN)/

CCFLAGS+=-DMODULE_VERSION="\"$(subst .,_,$(SO_VERSION))\""

include $(MKFILES_ROOT)/qmacros.mk

include $(SECTION_ROOT)/$(SECTION).mk
-include $(PROJECT_ROOT)/$(SECTION)/extra.mk


#####AUTO-GENERATED by packaging script... do not checkin#####
   INSTALL_ROOT_nto = $(PROJECT_ROOT)/../../../../../install
   USE_INSTALL_ROOT=1
##############################################################

include $(MKFILES_ROOT)/qtargets.mk


# The following will produce an archive of the installed components.
# PACKAGE_FILES should be set to the name of the artifact (no path information) 
# PROJECT_BASE should be set to the top level directory
# If the $(PROJECT_BASE)/package.mk is removed, packaging does nothing
PACKAGE_FILES=$(subst $(INSTALL_DIRECTORY)/,,$(wildcard $(INSTALL_DIRECTORY)/$(NAME)*))
PROJECT_BASE=$(PROJECT_ROOT)/../../
-include $(PROJECT_BASE)/package.mk
