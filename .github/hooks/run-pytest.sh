#!/bin/bash
# Wrapper script for pytest that exits cleanly when no tests are found
# Exit code 5 from pytest means "no tests collected" - treat as success

set +e  # Don't exit on error
pytest "$@"
exit_code=$?
set -e

# Exit code 5 = no tests collected (should be treated as success for pre-commit)
# Exit code 0 = all tests passed
if [ $exit_code -eq 0 ] || [ $exit_code -eq 5 ]; then
    exit 0
fi

# Any other exit code is a real failure
exit $exit_code
