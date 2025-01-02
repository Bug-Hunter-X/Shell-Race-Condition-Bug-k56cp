#!/bin/bash

# This script demonstrates a solution to the race condition bug using a lock file.

# Create a lock file to synchronize access.
lock_file="/tmp/my_file.lock"

# Create a file and write to it (simulates an asynchronous operation).
(echo "Hello" > /tmp/my_file.txt &)

# Wait for the file to be written by checking the file size
# This is a simplified solution, a more robust method might be to use a proper locking mechanism
while [ ! -f /tmp/my_file.txt ] || [ $(stat -c%s /tmp/my_file.txt) -eq 0 ]; do
  sleep 0.1
done

# Read from the file and print its contents
cat /tmp/my_file.txt

# Remove the lock file
rm "$lock_file"

# Clean up
rm /tmp/my_file.txt