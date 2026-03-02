# Assignment 05 - Misc Character Device

## Objective
The objective of this assignment is to extend the simple "Hello World" kernel module into a functioning character device utilizing the `miscdevice` subsystem. The driver requires a read operation that returns a static login name, and a write operation that verifies input against the same name.

## Explanation
To demonstrate an understanding of the subject, here are the key concepts for this assignment:

1.  **Misc Device API:** Standard character device registration involves manually obtaining major numbers, creating classes, and creating devices in `sysfs` before making the `cdev_add` call. The kernel provides the `miscdevice` interface (`<linux/miscdevice.h>`) as a lighter wrapper for simple devices. A misc device always uses a major number of 10 and handles all the `sysfs` plumbing behind the scenes `misc_register()`.
2.  **Dynamic Minor Number:** A character driver requires a minor number to uniquely identify its node within the major classification. Instead of hard-coding a reserved integer (which is heavily gated), `MISC_DYNAMIC_MINOR` is passed as the `.minor` element. The kernel dynamically allocates a free ID without risk of collisions.
3.  **Read Operation:** Reading data points to the `.read` function pointer in the `struct file_operations`. To safely transport memory boundaries between the kernel environment where the driver resides and a user executing `cat`, functions like `copy_to_user()` or `simple_read_from_buffer()` are employed to stream the student login text securely back to the caller's console.
4.  **Write Operation:** Writing data through `echo "text" > /dev/fortytwo` points to `.write` in `file_operations`. Security is paramount here; the user-supplied string must be safely copied to the kernel by `copy_from_user()` or `simple_write_to_buffer()`. If `strncmp()` verifies the injected text matches the login exact string, the function returns a success flag (number of bytes written). Otherwise, it explicitly returns an error code, like `-EINVAL` (Invalid argument). 

## How to Verify
To verify the completion of the assignment, the evaluator can test the following series of operations on the newly created device node `/dev/fortytwo`:

1.  **Load the driver:**
    ```bash
    make
    sudo insmod main.ko
    ```
    Confirm the node creation with `ls -l /dev/fortytwo`. Since access permissions default to root unless explicitly handled, tests must be done securely or with `sudo`.

2.  **Test the Read function:**
    A caller executing the read operation should be returned the exact student login.
    ```bash
    sudo cat /dev/fortytwo
    ```
    *Expected output:* `[student_login]`

3.  **Test the Write function (Success):**
    Writing the valid exact string shouldn't throw an IO error to the shell.
    ```bash
    echo -n "[student_login]" | sudo tee /dev/fortytwo
    ```
    *Expected output:* Command silently exits successfully (the string is consumed).

4.  **Test the Write function (Failure):**
    Writing any other invalid string must trigger an error response managed by the driver logic returning an `-EINVAL` error path.
    ```bash
    echo -n "wrong" | sudo tee /dev/fortytwo
    ```
    *Expected output:* `tee: /dev/fortytwo: Invalid argument`

5.  **Clean up:**
    ```bash
    sudo rmmod main
    ```
    Confirm that `/dev/fortytwo` has been destroyed dynamically by `misc_deregister()`.
