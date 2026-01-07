#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>

static int __init hello_init(void){
	pr_info("Hello World!\n");
	return (0);
}

static void __exit hello_exit(void){
	pr_info("Je quitte proprement\n");
}

module_init(hello_init);
module_exit(hello_exit);

MODULE_LICENSE("Free To Play");
MODULE_AUTHOR("Islem the terrible");
MODULE_DESCRIPTION("Big kernel linux improvment");
