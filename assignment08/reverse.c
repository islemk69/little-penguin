// SPDX-License-Identifier: GPL-2.0

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/miscdevice.h>
#include <linux/fs.h>
#include <linux/slab.h>
#include <linux/uaccess.h>
#include <linux/mutex.h>

static DEFINE_MUTEX(str_lock);
static char str[PAGE_SIZE];

static ssize_t myfd_read(struct file *fp, char __user *user,
			 size_t size, loff_t *offs)
{
	size_t len = strlen(str);
	ssize_t ret;
	char *tmp;
	int i, j;

	if (len == 0)
		return 0;

	tmp = kmalloc(PAGE_SIZE, GFP_KERNEL);
	if (!tmp)
		return -ENOMEM;

	mutex_lock(&str_lock);
	for (i = len - 1, j = 0; i >= 0; i--, j++)
		tmp[j] = str[i];
	tmp[j] = '\0';

	ret = simple_read_from_buffer(user, size, offs, tmp, len);
	mutex_unlock(&str_lock);

	kfree(tmp);
	return ret;
}

static ssize_t myfd_write(struct file *fp, const char __user *user,
			  size_t size, loff_t *offs)
{
	ssize_t res;

	if (size >= PAGE_SIZE)
		return -EINVAL;

	mutex_lock(&str_lock);
	memset(str, 0, PAGE_SIZE);
	res = simple_write_to_buffer(str, PAGE_SIZE - 1, offs, user, size);
	mutex_unlock(&str_lock);

	return res;
}

static const struct file_operations myfd_fops = {
	.owner = THIS_MODULE,
	.read = myfd_read,
	.write = myfd_write,
};

static struct miscdevice myfd_device = {
	.minor = MISC_DYNAMIC_MINOR,
	.name = "reverse",
	.fops = &myfd_fops,
};

static int __init myfd_init(void)
{
	return misc_register(&myfd_device);
}

static void __exit myfd_cleanup(void)
{
	misc_deregister(&myfd_device);
}

module_init(myfd_init);
module_exit(myfd_cleanup);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Islem the terrible");
MODULE_DESCRIPTION("Big kernel linux improvment");
