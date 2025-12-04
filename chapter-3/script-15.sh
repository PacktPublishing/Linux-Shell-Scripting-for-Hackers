#!/bin/bash

# Process options and parameters
while [ -n "$1" ]; do
  case "$1" in
    -a)
      echo "Option: -a"
      ;;
    -b)
      option_value="$2"
      echo "Option: -b, Value: $option_value"
      shift  # Shift past the option value
      ;;
    *)
      echo "Parameter: $1"  # Treat as parameter
      ;;
  esac
  shift
done

# Process remaining parameters
for param in "$@"; do
  echo "Parameter: $param"
done
