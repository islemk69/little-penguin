### README.md

Markdown

```
# Assignment 04 - USB Keyboard Auto-loading

[cite_start]Ce projet modifie le module "Hello World" de l'Assignment 01 pour qu'il se charge automatiquement dès qu'un clavier USB est détecté par le système[cite: 113, 117].

## 1. Nettoyage initial
Avant de commencer, assurez-vous que le module n'est pas déjà chargé manuellement :
```bash
sudo rmmod main 2>/dev/null

```

## 2. Installation du Module

Le système utilise `depmod` et `kmod` pour lier les identifiants matériels aux modules. Pour cela, le module doit être installé dans l'arborescence du noyau.

1.  **Compiler le module :**
    
    Bash
    
    ```
    make
    
    ```
    
2.  **Déployer le binaire :**
    
    Bash
    
    ```
    sudo cp main.ko /lib/modules/$(uname -r)/kernel/drivers/misc/
    
    ```
    
3.  **Mettre à jour la base des alias :**
    
    Bash
    
    ```
    sudo depmod -a
    
    ```
    

## 3. Configuration de la règle udev

Pour forcer le chargement via l'espace utilisateur, nous utilisons une règle `udev`.

1.  **Placer la règle :** Copiez le fichier `99-usb-keyboard.rules` dans le répertoire système :
    
    Bash
    
    ```
    sudo cp 99-usb-keyboard.rules /etc/udev/rules.d/
    
    ```
    
2.  **Contenu de la règle :** La règle cible la classe HID (03) et le protocole clavier (01) : `ACTION=="add", SUBSYSTEM=="usb", ATTR{bInterfaceClass}=="03", ATTR{bInterfaceProtocol}=="01", RUN+="/sbin/modprobe main"`
    
3.  **Activer la règle :**
    
    Bash
    
    ```
    sudo udevadm control --reload-rules
    sudo udevadm trigger
    
    ```
    

## 4. Vérification du Hotplug

Pour vérifier que le module fonctionne, surveillez les logs du noyau tout en simulant un branchement (via le moniteur QEMU ou physiquement) :

Bash

```
dmesg -w

```

Dès qu'un clavier est détecté, le message **"Hello World!"** doit apparaître sans intervention manuelle.

## 5. Détails Techniques

Le module utilise la macro `MODULE_DEVICE_TABLE(usb, ...)` pour exposer ses capacités au noyau, permettant ainsi aux outils hotplug de l'identifier comme le pilote approprié pour un clavier USB standard.

