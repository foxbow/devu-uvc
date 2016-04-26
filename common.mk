ifndef QCONFIG
QCONFIG=qconfig.mk
endif
include $(QCONFIG)

INSTALLDIR=sbin

ifeq ($(CPU),x86)
	CCFLAGS+=-march=core2
endif

CCFLAGS+=-O3

define PINFO
PINFO DESCRIPTION=USB Video Class driver
endef

USEFILE=../../../devu-uvc.use

include $(MKFILES_ROOT)/qtargets.mk
ifneq ($(VARIANT_LIST),)
	ifneq ($(filter v7,$(VARIANT_LIST)),)
		EXTRA_LIBVPATH+=../../../3dparty/uuid/nto/$(CPU)/a-le-v7/
		EXTRA_LIBVPATH+=../../../3dparty/jpeg/nto/$(CPU)/a-le-v7/
	else
		EXTRA_LIBVPATH+=../../../3dparty/uuid/nto/$(CPU)/a-$(VARIANT_LIST)/
		EXTRA_LIBVPATH+=../../../3dparty/jpeg/nto/$(CPU)/a-$(VARIANT_LIST)/
	endif
else
	EXTRA_LIBVPATH+=../../../3dparty/uuid/nto/$(CPU)/a/
	EXTRA_LIBVPATH+=../../../3dparty/jpeg/nto/$(CPU)/a/
endif

EXTRA_INCVPATH+=../../../3dparty/uuid/
EXTRA_INCVPATH+=../../../3dparty/jpeg/
EXTRA_INCVPATH+=../../../include/

ifneq ($(filter g,$(VARIANT_LIST)),)
	LIBS+=usbdi uuid_g jpeg_g
else
	LIBS+=usbdi uuid jpeg
endif
-include $(PROJECT_ROOT)/roots.mk
