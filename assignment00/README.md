# Assignment 00 - Custom Kernel

## Objective
The goal of this assignment is to download the mainline Linux kernel source code directly from Linus Torvalds's Git repository, configure it, compile it, and run it. The specific configuration requirement is to enable `CONFIG_LOCALVERSION_AUTO=y`.

## Explanation
To demonstrate an understanding of the subject, here are the key concepts for this assignment:

1.  **Linus's Git Tree:** The official upstream Linux kernel source code maintained by Linus Torvalds is hosted on kernel.org. The repository URL is `git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git`.
2.  **Kernel Configuration:** Before compiling, the kernel must be configured to select which features and drivers to include. This is saved in the `.config` file.
3.  **CONFIG_LOCALVERSION_AUTO=y:** This configuration option is crucial. When enabled, the kernel build system automatically appends the Git repository's revision information to the kernel version string (e.g., `-g<commit-hash>`). This makes it easy to identify the exact commit the kernel was built from by running `uname -r`.

## How to Verify
To verify the completion of the assignment, the evaluator can follow these steps:

1.  **Check the Config File:**
    Verify that the required configuration option is enabled in the supplied `.config` file:
    ```bash
    grep CONFIG_LOCALVERSION_AUTO .config
    ```
    *Expected output:* `CONFIG_LOCALVERSION_AUTO=y`

2.  **Check the Boot Log:**
    Inspect the provided `boot.log` file to confirm that the custom kernel was successfully booted and that its version string contains the Git commit hash:
    ```bash
    head -n 20 boot.log | grep "Linux version"
    ```
    *Expected output:* You should see a line similar to `Linux version X.Y.Z-g<commit-hash> ...` indicating that the kernel booted with the automatically generated local version.
