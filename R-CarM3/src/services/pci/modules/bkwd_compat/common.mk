ifndef QCONFIG
QCONFIG=qconfig.mk
endif
include $(QCONFIG)

NAME=pci_bkwd_compat
INSTALLDIR=lib/dll/pci/
USEFILE=$(PROJECT_ROOT)/$(NAME).use

# Module versioning. By specifying the SO_VERSION, we get DLL major/minor number
# versioning as with other libraries.
# A change to the major number is required if a module API will be broken. A
# change to the minor number MUST be backwards compatible with all lower
# numbered minor version of the same major number. This is used for bug fixes
# and/or additional functionality which does not change behaviour from the
# perspective of the DLL user 
#
# IMPORTANT - if you bump the SO_VERSION, do everyone a favour and add comments
#			  to the .use file indicating what changed
SO_VERSION=1.1

# qmacros.mk does not have a VERSION_TAG_DLL macro to enable the versioning of
# DLL's using the SO_VERSION= macro similar to libraries which use the so/
# directory name instead of dll/. We don't want to use the so/ directory name in
# our DLL's because that triggers the creation of static libraries as well.
# Instead we create the necessary macro here perhaps moving it to qmacros.mk
# later
VERSION_TAG_DLL=$(foreach ver,$(firstword $(SO_VERSION) 1),.$(ver))

include $(MKFILES_ROOT)/qmacros.mk

ifeq ($(CPU),arm)
	_V7=$(filter v7, $(VARIANT_LIST))
	V7=$(_V7:v7=.v7)
	END=$(filter le be, $(VARIANT_LIST))
	ENDIAN=$(END)$(V7)
else
	ENDIAN=$(filter le be, $(VARIANT_LIST))
endif

EXTRA_INCVPATH+=$(PROJECT_ROOT)/../../../../lib/pci/public
EXTRA_INCVPATH+=$(PROJECT_ROOT)/../../../../lib/pci
EXTRA_INCVPATH+=$(PROJECT_ROOT)/../../modules/capabilities/public
EXTRA_INCVPATH+=$(PROJECT_ROOT)/../../modules/hw
EXTRA_INCVPATH+=$(PROJECT_ROOT)/../../modules/slog
EXTRA_INCVPATH+=$(PROJECT_ROOT)/../../modules/debug

EXTRA_LIBVPATH+=$(PROJECT_ROOT)/../../../../lib/pci/so/$(CPU)/$(ENDIAN)/

EXTRA_SRCVPATH+=$(PROJECT_ROOT)/../_common/

CCFLAGS+=-DMODULE_VERSION="\"$(subst .,_,$(SO_VERSION))\""

# because programs written for the old PCI server will not be linked against
# libpci, we link it here so that when pci_bkwd_compat.so is pulled in, so to
# will libpci.so
LDOPTS+=-lpci


-include $(PROJECT_ROOT)/$(SECTION)/extra.mk

define PINFO
PINFO DESCRIPTION="PCI Server Backward Compatibility Module"
endef


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
