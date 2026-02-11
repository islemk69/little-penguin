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

/* Variables globales */
struct dentry *dir = NULL;     // Le dossier "fortytwo" [cite: 176]
struct mutex foo_mutex;        // Le verrou pour "foo" [cite: 181]
char *foo_data = NULL;         // Le buffer pour stocker les données de "foo"
size_t foo_size = 0;           // La taille des données actuelles dans "foo"

/* --- Fichier 1 : ID (Lecture/Ecriture pour tous) --- */
static ssize_t id_read(struct file *f, char __user *buf, size_t count, loff_t *ppos)
{
    /* Doit retourner le login ikaismou [cite: 178] */
    return simple_read_from_buffer(buf, count, ppos, MY_LOGIN, MY_LOGIN_LEN);
}

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

/* --- Fichier 2 : JIFFIES (Lecture seule) --- */
static ssize_t jiffies_read(struct file *f, char __user *buf, size_t count, loff_t *ppos)
{
    char tmp[32];
    int len;

    /* Retourne la valeur actuelle du timer jiffies [cite: 179] */
    len = sprintf(tmp, "%lu\n", jiffies);
    return simple_read_from_buffer(buf, count, ppos, tmp, len);
}

static const struct file_operations jiffies_fops = {
    .read = jiffies_read,
};

/* --- Fichier 3 : FOO (Ecriture Root, Lecture Tous, Mutex) --- */
static ssize_t foo_read(struct file *f, char __user *buf, size_t count, loff_t *ppos)
{
    ssize_t ret;

    mutex_lock(&foo_mutex); /* Protection contre les accès concurrents [cite: 181] */
    ret = simple_read_from_buffer(buf, count, ppos, foo_data, foo_size);
    mutex_unlock(&foo_mutex);

    return ret;
}

static ssize_t foo_write(struct file *f, const char __user *buf, size_t count, loff_t *ppos)
{
    /* Max une page de données  */
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

/* --- Init et Exit --- */
static int __init my_init(void)
{
    /* Allocation mémoire d'une page pour foo  */
    foo_data = kmalloc(PAGE_SIZE, GFP_KERNEL);
    if (!foo_data)
        return -ENOMEM;

    mutex_init(&foo_mutex);

    /* Création du dossier fortytwo dans debugfs [cite: 176] */
    dir = debugfs_create_dir("fortytwo", NULL);
    if (!dir) {
        kfree(foo_data);
        return -ENOMEM;
    }

    /* Création des fichiers avec les bonnes permissions [cite: 177] */
    debugfs_create_file("id", 0666, dir, NULL, &id_fops);      /* R/W pour tous [cite: 178] */
    debugfs_create_file("jiffies", 0444, dir, NULL, &jiffies_fops); /* R seul pour tous [cite: 179] */
    debugfs_create_file("foo", 0644, dir, NULL, &foo_fops);    /* W root seul, R tous  */

    return 0;
}

static void __exit my_exit(void)
{
    /* Nettoyage complet des fichiers et mémoire [cite: 182] */
    debugfs_remove_recursive(dir);
    kfree(foo_data);
}

module_init(my_init);
module_exit(my_exit);
MODULE_LICENSE("GPL");
