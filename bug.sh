#!/bin/bash

# This script demonstrates a race condition bug.

# Create a file and write to it.
# This should be in an asynchronous environment like a separate process or thread
# to highlight the race condition.
(echo "Hello" > /tmp/my_file.txt &)

# Attempt to read from the file and print its contents.
# This also should be in another separate thread
# For simplicity and illustration purposes only it is executed in the main thread
cat /tmp/my_file.txt

# Clean up
rm /tmp/my_file.txt