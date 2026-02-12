obj-m += mymounts.o

# CORRECTION : On met le chemin absolu vers les sources du noyau Thor
ccflags-y := -I/usr/src/linux-thor-kernel/fs

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
