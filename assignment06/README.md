# Assignment 06 - Linux-Next

## Objective
The objective of this assignment is to download, configure, build, and successfully boot the `linux-next` kernel.

## Explanation
To demonstrate an understanding of the subject, here are the key concepts for this assignment:

1.  **The linux-next Tree:** The Linux kernel development process relies on various maintainers managing different subsystems (like networking, USB, memory management). Before their patches are merged into Linus Torvalds's main repository (`mainline`) during the "merge window", they are collected in the `linux-next` integration tree.
2.  **Purpose:** This staging approach allows automated testing tools and developers to catch merge conflicts and integration bugs early, before they reach the main Git tree, ensuring the core of Linux remains stable.
3.  **Kernel Development Process:** Because `linux-next` aggregates thousands of patches daily from diverse subsystems, it is inherently unstable and changes every 24 hours. The documentation in `Documentation/development-process/` extensively details how code flows from developers to subsystem maintainers, then into `linux-next`, and finally to mainline.

## How to Verify
To verify the completion of the assignment, the evaluator can inspect the boot log to confirm the correct tree was compiled and booted.

1.  **Check the Boot Log:**
    Inspect the provided `boot.log` file to verify the kernel version string.
    ```bash
    head -n 20 boot.log | grep "Linux version"
    ```
    *Expected output:* You should see a line similar to `Linux version X.Y.Z-next-<date> ...` where the `-next-` suffix confirms the kernel was built from the `linux-next` tree rather than the stable or mainline repositories.
