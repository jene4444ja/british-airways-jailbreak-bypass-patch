/**
 * This tweak overrides the class that manages jailbreak detection within Sberbank app
 */


#import <substrate.h>

extern "C" int stat(const char *file_name, struct stat *buf);

int (*old_stat)(const char *file_name, struct stat *buf);

int new_stat(const char *file_name, struct stat *buf)
{
	if (
			strcmp(file_name, "Library/MobileSubstrate/MobileSubstrate.dylib") == 0 ||
			strcmp(file_name, "Library/MobileSubstrate/") == 0 ||
			strcmp(file_name, "Applications/Cydia.app") == 0 ||
			strcmp(file_name, "Applications/RockApp.app") == 0 ||
			strcmp(file_name, "Applications/Icy.app") == 0 ||
			strcmp(file_name, "Applications/WinterBoard.app") == 0 ||
			strcmp(file_name, "Applications/SBSettings.app") == 0 ||
			strcmp(file_name, "Applications/MXTube.app") == 0 ||
			strcmp(file_name, "Applications/IntelliScreen.app") == 0 ||
			strcmp(file_name, "Applications/blackra1n.app") == 0 ||
			strcmp(file_name, "Applications/FakeCarrier.app") == 0 ||
			strcmp(file_name, "Library/MobileSubstrate/DynamicLibraries/Veency.plist") == 0 ||
			strcmp(file_name, "Library/MobileSubstrate/DynamicLibraries/LiveClock.plist") == 0 ||
			strcmp(file_name, "System/Library/LaunchDaemons/com.ikey.bbot.plist") == 0 ||
			strcmp(file_name, "System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist") == 0 ||
			strcmp(file_name, "var/cache/apt") == 0 ||
			strcmp(file_name, "var/lib/cydia") == 0 ||
			strcmp(file_name, "var/log/syslog") == 0 ||
			strcmp(file_name, "var/tmp/cydia.log") == 0 ||
			strcmp(file_name, "bin/bash") == 0 ||
			strcmp(file_name, "bin/sh") == 0 ||
			strcmp(file_name, "usr/sbin/sshd") == 0 ||
			strcmp(file_name, "usr/libexec/ssh-keysign") == 0 ||
			strcmp(file_name, "usr/libexec/sftp-server") == 0 ||
			strcmp(file_name, "etc/ssh/sshd_config") == 0 ||
			strcmp(file_name, "usr/bin/ssh") == 0 ||
			strcmp(file_name, "usr/bin/sshd") == 0 ||
			strcmp(file_name, "etc/apt") == 0
			strcmp(file_name, "private/var/lib/apt") == 0 ||
			strcmp(file_name, "private/var/stash") == 0 ||
			strcmp(file_name, "private/var/tmp/cydia.log") == 0 ||
			strcmp(file_name, "private/var/lib/cydia") == 0 ||
			strcmp(file_name, "etc/clutch.conf") == 0 ||
			strcmp(file_name, "var/cache/clutch.plist") == 0 ||
			strcmp(file_name, "etc/clutch_cracked.plist") == 0 ||
			strcmp(file_name, "var/cache/clutch_cracked.plist") == 0 ||
			strcmp(file_name, "var/lib/clutch/overdrive.dylib") == 0 ||
			strcmp(file_name, "var/root/Documents/Cracked") == 0 ||
			strcmp(file_name, "private/var/lib/cydia") == 0 ||
			strcmp(file_name, "private/var/mobile/Library/SBSettings/Themes") == 0 ||
			strcmp(file_name, "System/Library/Frameworks/Foundation.framework") == 0 ||
			strcmp(file_name, "private/jailbreak.txt") == 0 ||
	   ) return -1;
	return old_stat(file_name, buf);
}

pid_t (*old_fork)(void);

pid_t new_fork(void)
{
	return -1;
}

%ctor
{
	@autoreleasepool
	{
		MSHookFunction((void *)stat, (void *)new_stat, (void **)&old_stat);		
		MSHookFunction((void *)fork, (void *)new_fork, (void **)&old_fork);		
	}
}
