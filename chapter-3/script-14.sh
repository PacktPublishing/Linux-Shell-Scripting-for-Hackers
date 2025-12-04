#!/bin/bash

# Process options and parameters
while [ -n "$1" ]; do
  case "$1" in
    -a)
      echo "Option: -a"
      ;;
    -b)
      echo "Option: -b"
      ;;
    --) # Double dash indicates end of options
      shift  # Shift past the double dash
      break
      ;;
    *)
      echo "Parameter: $1"  # Treat anything else as a parameter
      ;;
  esac
  shift
done

# Process remaining parameters
for param in "$@"; do
  echo "Parameter: $param"
done
