# Assignment 07 - Debugfs Interface

## Objective
The objective of this assignment is to explore `debugfs`, a simple RAM-based file system specifically designed for debugging purposes, by creating a subdirectory containing three distinct virtual files with varying read/write access permissions and locking mechanisms.

## Explanation
To demonstrate an understanding of the subject, here are the key concepts for this assignment:

1.  **Debugfs:** Standard character devices like `miscdevice` or `cdev` deal with hardware integration or more robust user-space interactions. `debugfs` (typically mounted at `/sys/kernel/debug`) is specifically intended as an easy rule-free zone for kernel developers to dump information to user space.
2.  **Creation and Permissions:** 
    *   Files and directories are created using APIs like `debugfs_create_dir()` and `debugfs_create_file()`.
    *   Parameters such as `0666` (readable and writable by all), `0444` (read-only), and `0644` (writable by root, readable by all) dictate file interaction rules directly.
    *   For the directory to be globally readable (since debugfs often defaults to root-only), we directly modify the `d_inode->i_mode` attribute of the returned `dentry` structure.
3.  **The `jiffies` file:** `jiffies` is a global kernel variable indicating the number of ticks since the system booted. The driver reads this value, formats it as a string, and outputs it safely to user space upon a read request.
4.  **The `foo` file and Locking:** Setting a buffer of one page size (`PAGE_SIZE`) is done dynamically via `kmalloc` during init. Because `foo` can be read and written simultaneously by multiple processes, simple buffer assignments are prone to race conditions causing memory corruption. Safe concurrency is guaranteed by implementing a mutual exclusion lock (`DEFINE_MUTEX(foo_mutex)`) surrounding the critical sections across the read and write operations.
5.  **Cleanup:** During module exit, `debugfs_remove_recursive()` acts to securely teardown the directory and its children, while `kfree()` clears the memory allocated for `foo`'s buffer.

## How to Verify
Before testing, ensure `debugfs` is mounted: 
```bash
sudo mount -t debugfs none /sys/kernel/debug/
```

To verify the completion of the assignment, evaluator can test the following:

1.  **Compile and Load:**
    Build the module (`make`) and load it (`sudo insmod main.ko`).

2.  **Test the `id` file (Read & Write by all):**
    ```bash
    cat /sys/kernel/debug/fortytwo/id
    echo "login" > /sys/kernel/debug/fortytwo/id
    ```
    *Expected output:* First command outputs the student login. The second writes successfully (no error).

3.  **Test the `jiffies` file (Read-only by all):**
    ```bash
    cat /sys/kernel/debug/fortytwo/jiffies
    echo "test" > /sys/kernel/debug/fortytwo/jiffies
    ```
    *Expected output:* First outputs a number (the kernel ticks). Second triggers a `Permission denied` error.

4.  **Test the `foo` file (Root write, All read):**
    ```bash
    echo "This is testing foo" | sudo tee /sys/kernel/debug/fortytwo/foo
    cat /sys/kernel/debug/fortytwo/foo
    echo "Normal user test" > /sys/kernel/debug/fortytwo/foo
    ```
    *Expected output:* First is written correctly via root. Second reads back exactly `This is testing foo`. Third triggers a `Permission denied` error because a normal user cannot write.

5.  **Clean up:**
    ```bash
    sudo rmmod main
    ```
    Check `ls /sys/kernel/debug/fortytwo/` to confirm the destruction of the debug files.
