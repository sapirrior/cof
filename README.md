### cof

cof (“Content Of”) is a lightweight C utility to display the contents of one or more files in the terminal, similar to `cat`, with colored output for readability.

Features:
- Prints [FILE] filename headers in orange and grey.
- Displays file contents in grey.
- Shows errors in two-tone: Error: in orange, system error message in grey.
- Supports multiple files as command-line arguments.

**Usage:**

    cof /path/to/file1 /path/to/file2
    ./cof /path/to/file1 /path/to/file2

**Compilation:**

    clang main.c ./utils/file.c -o cof
    gcc main.c ./utils/file.c -o cof
    make

    

**Files:**
- cof.c — main program handling CLI arguments.
- utils/file.c — contains the print_file function.
- utils/file.h — header defining print_file and ANSI color macros.

**By:**
*Nolan Stark*
