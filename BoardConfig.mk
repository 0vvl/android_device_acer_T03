
LOCAL_PATH := device/acer/T03

# inherit from the proprietary version
-include vendor/acer/T03/BoardConfigVendor.mk
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Link against libxlog
TARGET_LDPRELOAD += libxlog.so
 
# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := mt6735
TARGET_NO_BOOTLOADER := true

#Use prebuilt chromium
#PRODUCT_PREBUILT_WEBVIEWCHROMIUM := yes

#32 bit
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53
TARGET_BOARD_PLATFORM := mt6735
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_VFP := true

TARGET_GLOBAL_CFLAGS   += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
TARGET_USERIMAGES_USE_EXT4 := true

#extracted from stock recovery
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_BASE := 0x40000000

BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,32N2 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048

BOARD_CUSTOM_BOOTIMG_MK := device/acer/T03/mkbootimg.mk
BOARD_MKBOOTIMG_ARGS := --cmdline bootopt=64S3,32N2,32N2 --pagesize 2048 --base 0x40000000 --kernel_offset 0x00008000 --ramdisk_offset 0x04000000 --tags_offset 0x0e000000

# experimental
TARGET_REQUIRES_SYNCHRONOUS_SETSURFACE := true
TARGET_PROVIDES_INIT_RC := true

#extracted from /proc/partinfo
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1610612736
BOARD_FLASH_BLOCK_SIZE := 131072

#for now lets use prebuilt
TARGET_PREBUILT_KERNEL := device/acer/T03/prebuilt/kernel

#system.prop
TARGET_SYSTEM_PROP := device/acer/T03/system.prop

# CMHW
BOARD_HARDWARE_CLASS := device/acer/T03/cmhw/

# WiFi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM:="/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA:=STA
WIFI_DRIVER_FW_PATH_AP:=AP
WIFI_DRIVER_FW_PATH_P2P:=P2P

# RIL
BOARD_CONNECTIVITY_VENDOR := MediaTek
BOARD_USES_LEGACY_MTK_AV_BLOB := true


# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/acer/T03/bluetooth

# ANT
MTK_ANT_SUPPORT := yes
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# GPS
BOARD_GPS_LIBRARIES :=true
BOARD_CONNECTIVITY_MODULE := conn_soc
BOARD_MEDIATEK_USES_GPS := true

# Camera
USE_CAMERA_STUB := true

# Audio
TARGET_CPU_MEMCPY_OPT_DISABLE := true
BOARD_USES_MTK_AUDIO := true

# FM Radio
MTK_FM_SUPPORT := yes
MTK_FM_RX_SUPPORT := yes

#TWRP-recovery
#TARGET_RECOVERY_FSTAB := device/acer/T03/recovery/root/etc/twrp.fstab
#BOARD_SUPPRESS_SECURE_ERASE := true
#BOARD_HAS_NO_SELECT_BUTTON := true
#TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
#TW_MAX_BRIGHTNESS := 255
#TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp
#RECOVERY_GRAPHICS_USE_LINELENGTH := true
#TW_THEME := portrait_mdpi
##if sdcard0 is a /data/media emulated one
#RECOVERY_SDCARD_ON_DATA := true
#TW_EXCLUDE_DEFAULT_USB_INIT := true
#TW_INCLUDE_CRYPTO := true
#TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
#Recovery
BOARD_HAS_NO_SELECT_BUTTON := false
BOARD_RECOVERY_SWIPE := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_RECOVERY_INITRC := $(DEVICE_PATH)/recovery/init.mt6753.rc
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness\"

#Mediatek flags
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true
COMMON_GLOBAL_CFLAGS += -DMTK_HARDWARE -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL
COMMON_GLOBAL_CPPFLAGS += -DMTK_HARDWARE

#EGL settings
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/acer/T03/configs/egl.cfg
BOARD_EGL_WORKAROUND_BUG_10194508 := trues

TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file

# SELinux
BOARD_SEPOLICY_DIRS := \
       device/acer/T03/sepolicy

BOARD_SEPOLICY_UNION := \
    app.te \
    device.te \
    domain.te \
    file.te \
    file_contexts \
    fs_use \
    installd.te \
    net.te \
    netd.te \
    te_macros \
    vold.te \
    untrusted_app.te \
    platform_app.te \
    system_app.te \
    zygote.te \
    aal.te \
    akmd09911.te \
    akmd8963.te \
    akmd8975.te \
    ami304d.te \
    ist8303.te \
    mc6470d.te \
    qmcX983d.te \
    st480.te \
    af7133e.te \
    mmc3524xd.te \
    atcid.te \
    atci_service.te \
    audiocmdservice_atci.te \
    batterywarning.te \
    bmm050d.te \
    bmm056d.te \
    bmx056d.te \
    boot_logo_updater.te \
    br_app_data_service.te \
    BGW.te \
    ccci_fsd.te \
    ccci_mdinit.te \
    statusd.te \
    flashlessd.te \
    ccci_rpcd.te \
    eemcs_fsd.te \
    eemcs_mdinit.te \
    dhcp6c.te \
    dm_agent_binder.te \
    dualmdlogger.te \
    dumpstate.te \
    em_svr.te \
    enableswap.te \
    disableswap.te \
    factory.te \
    fota1.te \
    fuelgauged.te \
    geomagneticd.te \
    GoogleOtaBinder.te \
    gsm0710muxdmd2.te \
    gsm0710muxd.te \
    guiext-server.te \
    ipod.te \
    matv.te \
    mc6420d.te \
    mdlogger.te \
    mdnsd.te \
    memsicd3416x.te \
    bmc156d.te \
    memsicd.te \
    memsicp.te \
    meta_tst.te \
    mmc_ffu.te \
    mmp.te \
    mnld.te \
    mobile_log_d.te \
    mpud6050.te \
    msensord.te \
    mtk_6620_launcher.te \
    mtk_agpsd.te \
    mtkbt.te \
    muxreport.te \
    netdiag.te \
    nvram_agent_binder.te \
    nvram_backup_binder.te \
    nvram_daemon.te \
    orientationd.te \
    permission_check.te \
    poad.te \
    pppd_dt.te \
    pppd_via.te \
    pq.te \
    recovery.te \
    resmon.te \
    mtkrild.te \
    mtkrildmd2.te \
    viarild.te \
    s62xd.te \
    sn.te \
    epdg_wod.te \
    ipsec.te \
    terservice.te \
    thermald.te \
    thermal_manager.te \
    thermal.te \
    tiny_mkswap.te \
    tiny_swapon.te \
    vdc.te \
    volte_imcb.te \
    volte_ua.te \
    volte_stack.te \
    wmt_loader.te \
    icusbd.te \
    xlog.te \
    mobicore.te \
    install_recovery.te \
    program_binary.te \
    genfs_contexts

 

BOARD_SEPOLICY_UNION += \
	adbd.te \
	bluetooth.te \
	bootanim.te \
	clatd.te \
	drmserver.te \
	dhcp.te \
	dnsmasq.te \
	gpsd.te \
	hci_attach.te \
	healthd.te \
	hostapd.te \
	inputflinger.te \
	init.te \
	init_shell.te \
	isolated_app.te \
	keystore.te \
	kernel.te \
	lmkd.te \
	logd.te \
	mediaserver.te \
	mtp.te \
	nfc.te \
	racoon.te \
	radio.te \
	rild.te \
	runas.te \
	sdcardd.te \
	servicemanager.te \
	shared_relro.te \
	shell.te \
	system_app.te \
	system_server.te \
	surfaceflinger.te \
	tee.te \
	ueventd.te \
	uncrypt.te \
	watchdogd.te \
	wpa_supplicant.te \
	wpa.te \
	property.te \
	property_contexts \
	service.te \
	dmlog.te \
	MtkCodecService.te \
	ppl_agent.te \
	pvrsrvctl.te \
	wifi2agps.te \
	dex2oat.te \
	emdlogger.te \
	autokd.te \
	ppp.te \
	launchpppoe.te \
	sbchk.te \
	service_contexts \
	ril-3gddaemon.te \
	usbdongled.te \
	zpppd_gprs.te \
	md_ctrl.te \
	cmddumper.te \
	tunman.te
	
# Prebuilt kernel stuff
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)
