#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/miscdevice.h>
#include <linux/fs.h>
#include <linux/uaccess.h>

#define MY_LOGIN "ikaismou"
#define MY_LOGIN_LEN 8

static ssize_t my_read(struct file *file, char __user *buf,
		       size_t count, loff_t *ppos)
{
	/* Si on a déjà lu (offset > 0), on renvoie 0 pour dire "Fin du file" */
	if (*ppos > 0)
		return 0;

	/* On copie le login vers le buffer utilisateur */
	/* copy_to_user renvoie le nombre d'o NON copiés donc 0 si success*/
	if (copy_to_user(buf, MY_LOGIN, MY_LOGIN_LEN))
		return -EFAULT;

	/* On avance la position de lecture */
	*ppos = MY_LOGIN_LEN;

	/* On retourne le nombre d'octets lus */
	return MY_LOGIN_LEN;
}


static ssize_t my_write(struct file *file, const char __user *buf,
			size_t count, loff_t *ppos)
{
	char kbuf[MY_LOGIN_LEN + 1]; // Buffer temporaire dans le noyau

	/* Sécurité : Si l'utilisateur envoie une chaîne trop grande */
	/* Note: "echo" ajoute souvent un \n, donc on accepte len ou len+1 */
	if (count < MY_LOGIN_LEN)
		return -EINVAL;

	/* On récupère les données de l'utilisateur */
	if (copy_from_user(kbuf, buf, MY_LOGIN_LEN))
		return -EFAULT;

	kbuf[MY_LOGIN_LEN] = '\0'; // On s'assure que c'est une chaîne valide

	/* Comparaison : strncmp retourne 0 si c'est identique */
	if (strncmp(kbuf, MY_LOGIN, MY_LOGIN_LEN) == 0)
		return count; // Succès : on dit qu'on a tout "consommé"
	else
		return -EINVAL; // Echec : "Invalid argument"
}

/* On relie nos fonctions aux opérations système */
static const struct file_operations my_fops = {
	.owner = THIS_MODULE,
	.read = my_read,
	.write = my_write,
};

/* On définit le périphérique Misc [cite: 131] */
static struct miscdevice my_misc_device = {
	.minor = MISC_DYNAMIC_MINOR, // Le noyau choisit le numéro pour nous
	.name = "fortytwo",          // Le nom du fichier dans /dev/
	.fops = &my_fops,
};

static int __init my_init(void)
{
	int retval;

	/* On enregistre le device */
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
	/* On désenregistre le device */
	misc_deregister(&my_misc_device);
	pr_info("Module fortytwo déchargé\n");
}

module_init(my_init);
module_exit(my_exit);

MODULE_LICENSE("Free To Play");
MODULE_AUTHOR("Islem the terrible");
MODULE_DESCRIPTION("Big kernel linux improvment");
