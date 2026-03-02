# Assignment 02 - Makefile Patching

## Objective
The objective of this assignment is to modify the top-level kernel `Makefile` to change the `EXTRAVERSION` string to `-thor_kernel`, recompile, and ensure the locally built kernel incorporates this custom version string. It also requires creating a standardized patch file.

## Explanation
To demonstrate an understanding of the subject, here are the key concepts for this assignment:

1.  **Kernel Versioning:** The Linux kernel's version is defined at the very top of the root `Makefile` through four variables: `VERSION`, `PATCHLEVEL`, `SUBLEVEL`, and `EXTRAVERSION`. The final version string is a concatenation of these.
2.  **EXTRAVERSION:** This variable is specifically intended for developers and distributions to append a custom string (e.g., `-rc1`, `-custom`, or `-thor_kernel`) to easily identify their specific build.
3.  **Patching:** A patch is a text file that describes the differences between two versions of a file or a set of files. Submitting kernel changes requires adhering to `Documentation/process/submitting-patches.rst` (formerly `Documentation/SubmittingPatches`). Such a patch is typically generated using `git format-patch` or `diff -u` and includes a clear commit message, the author's sign-off, and the exact code changes.

## How to Verify
To verify the completion of the assignment, the evaluator can test the following:

1.  **Check the Patch File:**
    Review the provided `.patch` file. Ensure that:
    *   It modifies the top-level `Makefile`.
    *   It changes the line `EXTRAVERSION = ...` to exactly `EXTRAVERSION = -thor_kernel`.
    *   It format matches standard kernel patch requirements (diff unified format, proper headers).

2.  **Check the Boot Log:**
    Inspect the provided `boot.log` file to confirm that the custom kernel was successfully booted and that its version string contains the required string.
    ```bash
    head -n 20 boot.log | grep "Linux version"
    ```
    *Expected output:* You should see a line similar to `Linux version X.Y.Z-thor_kernel...` indicating that the changes made to the `Makefile` took effect.
