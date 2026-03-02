# Assignment 01 - Hello World Module

## Objective
The objective of this assignment is to create a simple "Hello World" kernel module that logs messages when it is loaded and unloaded. It must also compile dynamically on any system.

## Explanation
To demonstrate an understanding of the subject, here are the key concepts for this assignment:

1.  **Kernel Modules:** These are pieces of code that can be loaded and unloaded into the kernel on demand to extend its functionality without needing to reboot the system or rebuild the kernel.
2.  **`module_init()` and `module_exit()`:** 
    *   The function specified by the `module_init` macro is called when the module is inserted into the kernel using `insmod`. In this case, it prints "Hello world!".
    *   The function specified by the `module_exit` macro is called when the module is removed using `rmmod`, printing "Cleaning up module.".
3.  **Kernel Logging:** Modules use `printk()` or `pr_info()` to print messages to the kernel log buffer.
4.  **Makefile Cross-System Compatibility:** By using `$(shell uname -r)` in the Makefile, the module dynamically builds against the currently running kernel's headers (found at `/lib/modules/$(uname -r)/build`), satisfying the "compile on any system" requirement without hardcoding paths.

## How to Verify
To verify the completion of the assignment, the evaluator can test the following:

1.  **Compile the Module:**
    Build the module using the provided Makefile:
    ```bash
    make
    ```
    Ensure that a `main.ko` file is successfully generated.

2.  **Load the Module:**
    Insert the kernel module and check the kernel logs:
    ```bash
    sudo insmod main.ko
    dmesg | tail -1
    ```
    *Expected output:* `[<timestamp>] Hello world!`

3.  **Unload the Module:**
    Remove the kernel module and check the kernel logs again:
    ```bash
    sudo rmmod main
    dmesg | tail -1
    ```
    *Expected output:* `[<timestamp>] Cleaning up module.`

4.  **Clean up:**
    ```bash
    make clean
    ```
