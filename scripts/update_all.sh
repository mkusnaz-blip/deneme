#!/usr/bin/env bash
# Runs `sudo yum update -y` on all Vagrant VMs (rhel1..rhel6).
# Usage (bash/WSL/Cygwin):
#   bash ./scripts/update_all.sh

set -euo pipefail

for i in $(seq 1 6); do
  name="rhel${i}"
  echo "---- Updating ${name} ----"
  vagrant ssh "${name}" -c "sudo yum update -y" || {
    echo "Warning: ${name} update failed" >&2
  }
done

echo "All done."
