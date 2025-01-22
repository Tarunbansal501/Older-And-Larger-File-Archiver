# Older-And-Larger-File-Archiver
The OLDER and Larger FILE Archiver is a Linux-based script designed to automate the process of identifying and archiving files that are either large (over 20MB) or old (last modified more than 30 days ago). The script compresses these files using gzip and moves them to a dedicated archive directory within the base directory.

# Features

1.  Automatically identifies files that:

Are larger than a perticular size.

Have not been modified in the last perticular days

2.  Compresses identified files using gzip.

3.  Moves the compressed files to an archive directory.

4.  Ensures the base directory and archive directory exist, creating them if necessary.

5.  Logs actions with timestamps for tracking purposes.

# Script Workflow

1.  Directory Validation:

Checks if the base directory exists. If not, it exits with an error.

Creates the archive directory if it does not already exist.

2.  File Identification:

Searches for files larger than 20MB or older than 30 days within a specified depth of the base directory.

3.  File Compression and Archiving:

Compresses the identified files using gzip.

Moves the compressed files to the archive directory.

4.  Logging:

Displays and logs the file paths being archived, along with timestamps.

# Script Variables

BASE: The base directory where the script operates. Default: /Users/tarunbansal/project

DAYS: Unused variable (reserved for potential future enhancements).

DEPTH: Maximum directory depth for searching files. Default: 1.

RUN: Execution flag to control dry-run or actual execution. Default: 0 (perform actions).

TIME_THRESHOLD_DAYS: Threshold for considering files as "old". Default: 30 days.

# Prerequisites

Ensure you have bash installed on your system.

Confirm the base directory exists or modify the BASE variable to point to a valid directory.

