// SPDX-License-Identifier: GPL-2.0

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/debugfs.h>
#include <linux/jiffies.h>
#include <linux/mutex.h>
#include <linux/slab.h>
#include <linux/uaccess.h>

#define MY_LOGIN "ikaismou"
#define MY_LOGIN_LEN 8

struct dentry *dir = NULL;
struct mutex foo_mutex;
char *foo_data = NULL;
size_t foo_size = 0;

static ssize_t id_read(struct file *f, char __user *buf, size_t count, loff_t *ppos)
{
    return simple_read_from_buffer(buf, count, ppos, MY_LOGIN, MY_LOGIN_LEN);
}

//only ikaismou match
static ssize_t id_write(struct file *f, const char __user *buf, size_t count, loff_t *ppos)
{
    char kbuf[MY_LOGIN_LEN + 1];

    if (count != MY_LOGIN_LEN)
        return -EINVAL;
    if (copy_from_user(kbuf, buf, MY_LOGIN_LEN))
        return -EFAULT;

    if (strncmp(kbuf, MY_LOGIN, MY_LOGIN_LEN) == 0)
        return count;
    return -EINVAL;
}

static const struct file_operations id_fops = {
    .read = id_read,
    .write = id_write,
};


//update systemlock and print it
static ssize_t jiffies_read(struct file *f, char __user *buf, size_t count, loff_t *ppos)
{
    char tmp[32];
    int len;

    len = sprintf(tmp, "%lu\n", jiffies);
    return simple_read_from_buffer(buf, count, ppos, tmp, len);
}

static const struct file_operations jiffies_fops = {
    .read = jiffies_read,
};

static ssize_t foo_read(struct file *f, char __user *buf, size_t count, loff_t *ppos)
{
    ssize_t ret;

    mutex_lock(&foo_mutex);
    ret = simple_read_from_buffer(buf, count, ppos, foo_data, foo_size);
    mutex_unlock(&foo_mutex);

    return ret;
}


//foo open epty file that can store 40% of character with mutex security
static ssize_t foo_write(struct file *f, const char __user *buf, size_t count, loff_t *ppos)
{
    if (count > PAGE_SIZE)
        return -EINVAL;

    mutex_lock(&foo_mutex);
    if (copy_from_user(foo_data, buf, count)) {
        mutex_unlock(&foo_mutex);
        return -EFAULT;
    }
    foo_size = count;
    mutex_unlock(&foo_mutex);

    return count;
}

static const struct file_operations foo_fops = {
    .read = foo_read,
    .write = foo_write,
};

static int __init my_init(void)
{
    foo_data = kmalloc(PAGE_SIZE, GFP_KERNEL);
    if (!foo_data)
        return -ENOMEM;

    mutex_init(&foo_mutex);

    dir = debugfs_create_dir("fortytwo", NULL);
    if (!dir) {
        kfree(foo_data);
        return -ENOMEM;
    }

    debugfs_create_file("id", 0666, dir, NULL, &id_fops);
    debugfs_create_file("jiffies", 0444, dir, NULL, &jiffies_fops);
    debugfs_create_file("foo", 0644, dir, NULL, &foo_fops);

    return 0;
}

static void __exit my_exit(void)
{
    debugfs_remove_recursive(dir);
    kfree(foo_data);
}

module_init(my_init);
module_exit(my_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Islem the terrible");
MODULE_DESCRIPTION("Big kernel linux improvment");