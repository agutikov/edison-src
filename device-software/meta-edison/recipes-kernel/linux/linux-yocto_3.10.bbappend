FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
COMPATIBLE_MACHINE = "edison"
LINUX_VERSION = "3.10.17"
SRCREV_machine = "c03195ed6e3066494e3fb4be69154a57066e845b"
SRCREV_meta = "6ad20f049abd52b515a8e0a4664861cfd331f684"

SRC_URI += "file://defconfig"
SRC_URI += "file://upstream_to_edison.patch"

do_kernel_configme() {
	echo "[INFO] doing kernel configme"
	export KMETA=${KMETA}

	if [ -n ${KCONFIG_MODE} ]; then
		configmeflags=${KCONFIG_MODE}
	else
		# If a defconfig was passed, use =n as the baseline, which is achieved
		# via --allnoconfig
		if [ -f ${WORKDIR}/defconfig ]; then
			configmeflags="--allnoconfig"
		fi
	fi

	cd ${S}
	PATH=${PATH}:${S}/scripts/util
	configme ${configmeflags} --reconfig --output ${B} ${LINUX_KERNEL_TYPE} ${KMACHINE}
	if [ $? -ne 0 ]; then
		echo "ERROR. Could not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}"
		exit 1
	fi
}

