#!/bin/bash

PACKAGES="base nvim zed"

echo "=== Showing plan ==="
for pkg in $PACKAGES; do
  echo "--- Package: $pkg ---"
  stow -nv -R "$pkg"
done

read -p "Continue? [y/N] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  exit 0
fi

echo "=== Applying ==="
for pkg in $PACKAGES; do
  stow -R "$pkg"
done