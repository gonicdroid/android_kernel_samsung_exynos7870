# SPDX-License-Identifier: GPL-2.0
quote := "
DTB_NAMES := $(subst $(quote),,$(CONFIG_BUILD_ARM64_APPENDED_DTB_IMAGE_NAMES))

ifneq ($(DTB_NAMES),)
dtb-y += $(addsuffix .dtb, $(DTB_NAMES))
endif

targets += dtbs $(dtb-y)
always  += $(dtb-y)

dtbs: $(addprefix $(obj)/, $(dtb-y))

clean-files := dts/*.dtb *.dtb