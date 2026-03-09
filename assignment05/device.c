// SPDX-License-Identifier: GPL-2.0

#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/miscdevice.h>
#include <linux/fs.h>
#include <linux/uaccess.h>

#define MY_LOGIN "ikaismou"
#define MY_LOGIN_LEN 8


//cat /dev/frotytwo
static ssize_t my_read(struct file *file, char __user *buf,
		       size_t count, loff_t *ppos)
{
	if (*ppos > 0)
		return 0;

	if (copy_to_user(buf, MY_LOGIN, MY_LOGIN_LEN))
		return -EFAULT;

	*ppos = MY_LOGIN_LEN;

	return MY_LOGIN_LEN;
}

//echo -n "[string]]" |  tee /dev/fortytwo
static ssize_t my_write(struct file *file, const char __user *buf,
			size_t count, loff_t *ppos)
{
	char kbuf[MY_LOGIN_LEN + 1];

	if (count < MY_LOGIN_LEN)
		return -EINVAL;

	if (copy_from_user(kbuf, buf, MY_LOGIN_LEN))
		return -EFAULT;

	kbuf[MY_LOGIN_LEN] = '\0';

	if (strncmp(kbuf, MY_LOGIN, MY_LOGIN_LEN) == 0)
		return count;
	else
		return -EINVAL;
}

static const struct file_operations my_fops = {
	.owner = THIS_MODULE,
	.read = my_read,
	.write = my_write,
};

static struct miscdevice my_misc_device = {
	.minor = MISC_DYNAMIC_MINOR,
	.name = "fortytwo",
	.fops = &my_fops,
};

static int __init my_init(void)
{
	int retval;

	retval = misc_register(&my_misc_device);
	if (retval) {
		pr_err("Impossible d'enregistrer le device misc fortytwo\n");
		return retval;
	}

	pr_info("Module fortytwo chargé et device enregistré\n");
	return 0;
}

static void __exit my_exit(void)
{
	misc_deregister(&my_misc_device);
	pr_info("Module fortytwo déchargé\n");
}

module_init(my_init);
module_exit(my_exit);

MODULE_LICENSE("Free To Play");
MODULE_AUTHOR("Islem the terrible");
MODULE_DESCRIPTION("Big kernel linux improvment");
