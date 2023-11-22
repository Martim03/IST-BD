#!/bin/bash

DIR="/home/lourenco/projects/db-project/Entrega3/web/"  # replace this with your directory path

# Check the first argument
if [[ $1 == "103432" ]]; then
    OLD_USER='103544'
    NEW_USER='103432'
    OLD_PATH='/4/4/ist1103544'
    NEW_PATH='/3/2/ist1103432'
else
    OLD_USER='103432'
    NEW_USER='103544'
    OLD_PATH='/3/2/ist1103432'
    NEW_PATH='/4/4/ist1103544'
fi

# Use find to get all files in the directory and its subdirectories
find "$DIR" -type f | while read -r file; do
    # Skip if the file is 'login.py'
    if [[ $file == *"login.py"* ]]; then
        continue
    fi

    # Use sed to replace the old path with the new path in each file
    sed -i "s|$OLD_PATH|$NEW_PATH|g" "$file"

    # Use sed to replace the old user with the new user in each file
    sed -i "s/$OLD_USER/$NEW_USER/g" "$file"
done
