# Assignment 08 - Code Fixes and Style

## Objective
The objective of this assignment is to take a given buggy and improperly formatted C file, deduce its intended behavior, fix its functional bugs, and ensure it complies strictly with the Linux kernel coding style.

## Explanation
To demonstrate an understanding of the subject, here are the key concepts for this assignment:

1.  **Intended Behavior Deduction:** A close look at the original code reveals a `miscdevice` named "reverse". The read function allocates a temporary string, iterates through a global string array (`str`) from the end to the beginning (inversely), and returns the reversed string to user space. The write function takes input from the user and stores it in `str`. Thus, this character device reverses the text written to it.
2.  **Functional Bugs:** The original code contains several severe bugs:
    *   **Memory Leak:** In `myfd_read`, `kmalloc` is used to allocate memory for the reversed string (`tmp2`), but it is never freed (`kfree()`). Every read operation leaks memory.
    *   **Buffer Overflows:** The `myfd_write` function blindy assumes `size` fits within `PAGE_SIZE` when copying memory. Writing more than `PAGE_SIZE` characters instantly corrupts kernel memory (`str[size + 1] = 0x0;`).
    *   **Missing Error Checks:** The `kmalloc` call does not verify if the allocation failed (`if (!tmp2)` returns `-ENOMEM`).
    *   **Misc Deregistration:** The cleanup function `myfd_cleanup` is empty, failing to call `misc_deregister()`!
3.  **Kernel Coding Style:** 
    *   Replaced spaced indentation with 8-character tabs.
    *   Fixed incorrect block nesting (`{` and `}` placement).
    *   Properly aligned function definitions, and removed obsolete arbitrary visual dividers (`/**********/`).
    *   Variables initialized locally rather than loosely declared globally or mid-function.

## How to Verify
To verify the completion of the assignment, the evaluator can test the following:

1.  **Style Check:**
    Run the `checkpatch.pl` script to prove no format errors remain:
    ```bash
    ./scripts/checkpatch.pl -f <path-to-file.c>
    ```
    *Expected output:* `0 errors, 0 warnings`.

2.  **Load the driver:**
    ```bash
    make
    sudo insmod main.ko
    ```

3.  **Test the Device:**
    Write a string into the newly created `/dev/reverse` misc device, and read from it immediately after.
    ```bash
    echo -n "LittlePenguin" | sudo tee /dev/reverse
    cat /dev/reverse
    ```
    *Expected output:* `niugnePelttiL` (The reversed input string).

4.  **Clean up:**
    ```bash
    sudo rmmod main
    ```
