#include <stdlib.h>
#include <string.h>

static const auto MOUNT = "-mount";
static const auto UMOUNT = "-umount";
static const auto EXIT = 0;

int main(int argc, char* argv[]) {
	if ( argc < 2 )
		return EXIT;

	if ( !strcmp( argv[1], MOUNT ) ) {
		system( "mkdir /mnt/usb/usb0" );
		system( "mount /dev/udisk_auto_mount_ready /mnt/usb/usb0/" );
	} else if ( !strcmp( argv[1], UMOUNT ) ) {
		system( "umount /mnt/usb/usb0/" );
		system( "rm -rf /mnt/usb/usb0/" );
	} else
		;

	return EXIT;
}
