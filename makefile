CXX = arm-none-linux-gnueabi-g++
CXX_FLAGS = -O3 -Wall -std=c++0x
SOURCE = auto_mount_umount.cpp
TARGET = auto_mount_umount
SCRIPT = 98-pioneer-mount-umount.rules
INCLUDE_PATH = -I/opt/freescale/ltib/rootfs/usr/include/
DYNAMIC_LIBS_PATH = -L/opt/freescale/ltib/rootfs/usr/lib/ -lusb-1.0

$(TARGET) : $(SOURCE)
	$(CXX) $^ -o $@ $(CXX_FLAGS) $(INCLUDE_PATH)

install :
	sudo cp -vf $(TARGET) ../ltib/rootfs/usr/bin/
	sudo cp -vf $(SCRIPT) ../ltib/rootfs/etc/udev/rules.d/
	sudo mkdir ../ltib/rootfs/mnt/usb/

.PHONY : clean
clean :
	rm -vf $(TARGET)
