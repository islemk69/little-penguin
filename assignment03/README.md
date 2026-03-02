# Assignment 03 - Coding Style

## Objective
The objective of this assignment is to take a poorly formatted C source file and refactor it to strictly comply with the Linux kernel coding style conventions outlined in `Documentation/process/coding-style.rst`.

## Explanation
To demonstrate an understanding of the subject, here are the key concepts for this assignment:

1.  **Strict Coding Standards:** The Linux kernel project has a very strict set of rules for how code must be formatted. If a developer submits code that does not follow these rules, it will quickly be rejected.
2.  **Kernel Formatting Rules:**
    *   **Indentation:** 8-character hardware tabs (not spaces).
    *   **Braces:** Following the K&R style, opening braces generally go on the same line as the statement (e.g., `if`, `for`), but on a new line for function definitions.
    *   **Variable Declarations:** Declared at the start of the block, not interleaved with code.
    *   **Printing:** Using kernel-specific printing mechanisms like `pr_info()` instead of standard C library functions (like `printf`).
3.  **checkpatch.pl:** The kernel source provides a Perl script (`scripts/checkpatch.pl`) that automatically analyzes code for styling errors, making it the definitive tool to verify code styling before submitting patches.

## How to Verify
To verify the completion of the assignment, the evaluator can test the following:

1.  **Visual Inspection:**
    Open the submitted C file. Observe that the indentation uses tabs, not spaces, and standard structural bracing is applied properly. Look for the removal of unnecessarily nested code or bad styling artifacts.

2.  **Run Checkpatch:**
    Use the kernel's built-in tool to verify the code against the standards. Inside the kernel source tree, run checkpatch against the provided file:
    ```bash
    ./scripts/checkpatch.pl -f <path-to-the-submitted-file.c>
    ```
    *Expected output:* The script should output `0 errors, 0 warnings`, meaning the file perfectly complies with the kernel coding style.
