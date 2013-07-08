#!/system/bin/sh

# outputfile to save result
OUT_FILE="/data/data/mobi.cyann.cattools/preload.prop"

# prepare the file
echo "" > $OUT_FILE

# arm volt
STAT=`cat /sys/class/misc/customvoltage/max_arm_volt`
case "$?" in
	0)
	echo "key_max_arm_volt=$STAT" >> $OUT_FILE
	;;
	*)
	echo "key_max_arm_volt=-1" >> $OUT_FILE
	;;
esac

# int volt
STAT=`cat /sys/class/misc/customvoltage/max_int_volt`
case "$?" in
	0)
	echo "key_max_int_volt=$STAT" >> $OUT_FILE
	;;
	*)
	echo "key_max_int_volt=-1" >> $OUT_FILE
	;;
esac

# bld
STAT=`cat /sys/class/misc/backlightdimmer/enabled`
case "$STAT" in
	1)
	echo "key_bld_status=1" >> $OUT_FILE
	echo "key_bld_delay=`cat /sys/class/misc/backlightdimmer/delay`" >> $OUT_FILE
	;;
	0)
	echo "key_bld_status=0" >> $OUT_FILE
	echo "key_bld_delay=`cat /sys/class/misc/backlightdimmer/delay`" >> $OUT_FILE
	;;
	*)
	echo "key_bld_status=-1" >> $OUT_FILE
	echo "key_bld_delay=-1" >> $OUT_FILE
	;;
esac

# bln
STAT=`cat /sys/class/misc/backlightnotification/enabled`
case "$STAT" in
	1)
	echo "key_bln_status=1" >> $OUT_FILE
	echo "key_bln_blink=`cat /sys/class/misc/backlightnotification/in_kernel_blink`" >> $OUT_FILE
	echo "key_bln_blink_interval=`cat /sys/class/misc/backlightnotification/blink_interval`" >> $OUT_FILE
	echo "key_bln_blink_count=`cat /sys/class/misc/backlightnotification/max_blink_count`" >> $OUT_FILE
	;;
	0)
	echo "key_bln_status=0" >> $OUT_FILE
	echo "key_bln_blink=`cat /sys/class/misc/backlightnotification/in_kernel_blink`" >> $OUT_FILE
	echo "key_bln_blink_interval=`cat /sys/class/misc/backlightnotification/blink_interval`" >> $OUT_FILE
	echo "key_bln_blink_count=`cat /sys/class/misc/backlightnotification/max_blink_count`" >> $OUT_FILE
	;;
	*)
	echo "key_bln_status=-1" >> $OUT_FILE
	;;
esac

# blx
STAT=`cat /sys/class/misc/batterylifeextender/charging_limit`
case "$?" in
	0)
	echo "key_blx_charging_limit=$STAT" >> $OUT_FILE
	;;
	*)
	echo "key_blx_charging_limit=-1" >> $OUT_FILE
	;;
esac

# deepidle
STAT=`cat /sys/class/misc/deepidle/enabled`
case "$STAT" in
	1)
	echo "key_deepidle_status=1" >> $OUT_FILE
	;;
	0)
	echo "key_deepidle_status=0" >> $OUT_FILE
	;;
	*)
	echo "key_deepidle_status=-1" >> $OUT_FILE
	;;
esac

# dynamic fsync
STAT=`cat /sys/kernel/dyn_fsync/Dyn_fsync_active`
case "$STAT" in
	1)
	echo "key_dynamic_fsync_forced=1" >> $OUT_FILE
	;;
	0)
	echo "key_dynamic_fsync_forced=0" >> $OUT_FILE
	;;
	*)
	echo "key_dynamic_fsync_forced=-1" >> $OUT_FILE
	;;
esac

# cmled
STAT=`ls /sys/class/misc/notification/`
case "$?" in
	0)
	echo "key_cmled_blink=`cat /sys/class/misc/notification/blink`" >> $OUT_FILE
	echo "key_cmled_blinktimeout=`cat /sys/class/misc/notification/blinktimeout`" >> $OUT_FILE
	;;
	*)
	echo "key_cmled_blink=-1" >> $OUT_FILE
	echo "key_cmled_blinktimeout=-1" >> $OUT_FILE
	;;
esac

STAT=`cat /sys/class/misc/notification/bl_timeout`
case "$?" in
	0)
	echo "key_cmled_bltimeout=$STAT" >> $OUT_FILE
	;;
	*)
	echo "key_cmled_bltimeout=-1" >> $OUT_FILE
	;;
esac

# liveoc
STAT=`cat /sys/class/misc/liveoc/oc_value`
case "$?" in
	0)
	echo "key_liveoc=$STAT" >> $OUT_FILE
	;;
	*)
	echo "key_liveoc=-1" >> $OUT_FILE
	;;
esac

STAT=`cat /sys/class/misc/liveoc/oc_target_high`
case "$?" in
	0)
	echo "key_liveoc_target_high=$STAT" >> $OUT_FILE
	;;
	*)
	echo "key_liveoc_target_high=-1" >> $OUT_FILE
	;;
esac

STAT=`cat /sys/class/misc/liveoc/oc_target_low`
case "$?" in
	0)
	echo "key_liveoc_target_low=$STAT" >> $OUT_FILE
	;;
	*)
	echo "key_liveoc_target_low=-1" >> $OUT_FILE
	;;
esac

# touchwake
STAT=`cat /sys/class/misc/touchwake/enabled`
case "$STAT" in
	1)
	echo "key_touchwake_status=1" >> $OUT_FILE
	echo "key_touchwake_delay=`cat /sys/class/misc/touchwake/delay`" >> $OUT_FILE
	;;
	0)
	echo "key_touchwake_status=0" >> $OUT_FILE
	echo "key_touchwake_delay=`cat /sys/class/misc/touchwake/delay`" >> $OUT_FILE
	;;
	*)
	echo "key_touchwake_status=-1" >> $OUT_FILE
	echo "key_touchwake_delay=-1" >> $OUT_FILE
	;;
esac

# cpu governor
STAT=`cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor`
case "$?" in
	0)
	echo "key_governor=$STAT" >> $OUT_FILE
	;;
	*)
	echo "key_governor=-1" >> $OUT_FILE
	;;
esac

# available governors
STAT=`cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors`
case "$?" in
	0)
	echo "key_available_governor=$STAT" >> $OUT_FILE
	;;
	*)
	echo "key_available_governor=-1" >> $OUT_FILE
	;;
esac

# cpu min freq
STAT=`cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq`
case "$?" in
	0)
	echo "key_min_cpufreq=$STAT" >> $OUT_FILE
	;;
	*)
	echo "key_min_cpufreq=-1" >> $OUT_FILE
	;;
esac

# cpu max freq
STAT=`cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq`
case "$?" in
	0)
	echo "key_max_cpufreq=$STAT" >> $OUT_FILE
	;;
	*)
	echo "key_max_cpufreq=-1" >> $OUT_FILE
	;;
esac

# iosched
STAT=`cat /sys/block/mmcblk0/queue/scheduler`
case "$?" in
	0)
	echo "key_iosched=$STAT" >> $OUT_FILE
	;;
	*)
	echo "key_iosched=-1" >> $OUT_FILE
	;;
esac
