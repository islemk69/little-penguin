#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/proc_fs.h>
#include <linux/seq_file.h>
#include <linux/nsproxy.h>
#include <linux/ns_common.h>
#include <linux/rbtree.h>
#include <linux/fs.h>
#include <linux/dcache.h>
#include <linux/path.h>
#include <linux/slab.h>

/* * IMPORTANT : Grâce au Makefile (-I.../fs), on peut inclure ce fichier interne.
 * Il contient TOUTES les définitions exactes (mount, mnt_namespace, mnt_pcp...)
 * Pas besoin de les redéfinir à la main !
 */
#include "mount.h"

static int mymounts_show(struct seq_file *m, void *v)
{
    struct mnt_namespace *ns;
    struct rb_node *node;
    struct mount *mnt;
    struct path p;
    char *path_buf;
    char *path_ptr;

    /* On récupère le namespace */
    ns = (struct mnt_namespace *)current->nsproxy->mnt_ns;
    if (!ns)
        return 0;

    path_buf = (char *)__get_free_page(GFP_KERNEL);
    if (!path_buf)
        return -ENOMEM;

    /* --- PARCOURS DE L'ARBRE ROUGE-NOIR --- */
    for (node = rb_first(&ns->mounts); node; node = rb_next(node)) {

        /* * MAGIE : Ici, struct mount vient de mount.h
         * L'offset est donc garanti correct par le compilateur !
         */
        mnt = rb_entry(node, struct mount, mnt_node);

        /* Sécurité anti-crash */
        if (!mnt || !mnt->mnt.mnt_root || !mnt->mnt.mnt_sb)
            continue;

        p.mnt = &mnt->mnt;
        p.dentry = mnt->mnt.mnt_root;

        path_ptr = d_path(&p, path_buf, PAGE_SIZE);
        if (IS_ERR(path_ptr))
            continue;

        seq_printf(m, "%-15s %s\n",
               mnt->mnt.mnt_sb->s_id,
               path_ptr);
    }

    free_page((unsigned long)path_buf);
    return 0;
}

static int mymounts_open(struct inode *inode, struct file *file)
{
    return single_open(file, mymounts_show, NULL);
}

static const struct proc_ops mymounts_fops = {
    .proc_open    = mymounts_open,
    .proc_read    = seq_read,
    .proc_lseek   = seq_lseek,
    .proc_release = single_release,
};

static int __init mymounts_init(void)
{
    if (!proc_create("mymounts", 0444, NULL, &mymounts_fops))
        return -ENOMEM;
    return 0;
}

static void __exit mymounts_exit(void)
{
    remove_proc_entry("mymounts", NULL);
}

module_init(mymounts_init);
module_exit(mymounts_exit);
MODULE_LICENSE("GPL");
