# Nom du module (doit correspondre au nom du fichier .c)
obj-m += main.o

# Chemin vers les sources du noyau actuel
KDIR := /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

all:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean
