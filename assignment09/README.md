# Assignment 09 - Mount Points via procfs

## Objective
The objective of this assignment is to create a dynamic kernel module that registers a virtual file under the `procfs` system at `/proc/mymounts`. Reading this file iteratively lists the active mount points of the system and their associated names, requiring linked list traversal across kernel internal namespace structures.

## Explanation
To demonstrate an understanding of the subject, here are the key concepts for this assignment:

1.  **Procfs:** The `/proc` filesystem is a pseudo-filesystem which provides an interface to kernel data structures. It is commonly used for process tracking but also for creating general system state virtual files.
2.  **`proc_create`:** This kernel API simplifies the creation of virtual files in `/proc`. We register the entry `mymounts` pointing its file operations structure to our custom read sequence.
3.  **The `seq_file` Interface:** When creating proc files that output more than a few bytes of data, the `seq_file` wrapper is necessary. Instead of managing complex single buffers across multiple `.read` operations, `seq_file` provides simple iterating operations (`start`, `next`, `stop`, `show`) allowing us to print formatted data efficiently.
4.  **Navigating Mount Points:** 
    *   Mount points and filesystems are deeply integrated into the kernel's Virtual File System (VFS).
    *   Mounts are typically organized inside a namespace tree corresponding to the current running process: `current->nsproxy->mnt_ns`.
    *   By securely locking the namespace semaphore (`down_read(&namespace_sem)`), the module iterates over the double-linked list `mnt_ns->list` utilizing the fundamental `list_for_each_entry` kernel macro.
    *   For each mount struct found within the namespace, the module securely extracts and formats the mount point name (`mnt->mnt_root->d_name.name`) and the directory mounting path.

``` bash
1. L'accès initial (ns = ...)

On part de l'utilisateur (current) pour trouver son "classeur" de montages personnels.
Bash

[ current (task_struct) ]  <-- Le processus qui fait "cat"
       |
       +--> [ nsproxy ]    <-- Le conteneur de namespaces
               |
               v
        [ mnt_namespace (ns) ]  <-- TON OBJET 'ns'
        |  - (int) seq          |
        |  - (rb_root) mounts   | <--- La racine de l'arbre est ICI
        +-----------------------+

2. L'Arbre Rouge-Noir (&ns->mounts et node)

Dans ce classeur, les montages sont rangés dans un arbre binaire trié. rb_first va chercher le nœud le plus à gauche.
Bash

      [ &ns->mounts ]  (Racine de l'arbre)
             /   \
          [node] [node]
          /   \
    [node]    [node]
      ^
      |
    node = rb_first(...)  <-- Le premier élément "physique" trouvé

3. Le "Casting" (mnt = rb_entry(...))

Le node n'est qu'un petit morceau. On utilise la macro rb_entry pour retrouver la grosse structure qui l'entoure.
Bash

+------------------------------------------+
| struct mount (mnt)                       |
|  - (char*) mnt_devname: "/dev/sda1"      |
|  - (struct super_block*) mnt_sb          |
|                                          |
|  +------------------------------------+  |
|  | mnt_node (struct rb_node) <--------|--+--- C'est ton 'node' actuel
|  +------------------------------------+  |
+------------------------------------------+

4. La préparation du paquet (struct path p)

Tu extrais deux pointeurs de ton gros dossier mnt pour les mettre dans une petite boîte p. C'est ton "ticket" pour la fonction de traduction.
Bash

      [ struct mount (mnt) ]          [ struct path p ]
      |                    |          +-----------------+
      |  .mnt  ------------|--------->| .mnt            |
      |  .mnt_root --------|--------->| .dentry         |
      +--------------------+          +-----------------+
                                        (La boîte est prête)

5. La traduction finale (path_ptr = d_path(...))

Tu donnes ta boîte p et ton buffer vide à d_path. Elle remonte l'arborescence et écrit le texte à la fin du buffer (car elle travaille à l'envers !).
Bash

 [ struct path p ] --( Traduction )--> [ path_buf (4096 octets) ]
                                       |                        |
                                       |  [ ... /home/islem \0] |
                                       |        ^               |
                                       +--------|---------------+
                                                |
                                             path_ptr
                                     (Pointe sur le début du texte)
```

## How to Verify
To verify the completion of the assignment, the evaluator can test the following:

1.  **Compile and Load:**
    Build the module (`make`) and load it:
    ```bash
    sudo insmod main.ko
    ```
    Confirm `/proc/mymounts` is successfully created: `ls -l /proc/mymounts`.

2.  **Inspect Mounts:**
    Perform a read on the custom procfs file:
    ```bash
    cat /proc/mymounts
    ```
    *Expected output:* A two-column list output mapping root file systems paths, identical in concept to `root /`, `sys /sys`, `proc /proc`. Note that depending on system configuration, a system might show significantly more output. You can compare it conceptually to the built-in `cat /proc/mounts`.

3.  **Clean up:**
    ```bash
    sudo rmmod main
    ```
    Ensure reading `/proc/mymounts` now fails (`No such file or directory`) indicating proper `proc_remove()` cleanup during exit.
