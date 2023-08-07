#!/bin/bash
set -e  # This means that if any command in the script fails (returns a non-zero exit status), the script will immediately exit and not continue executing the remaining commands.

CONFIG_PLAYBOOK_DIR="$HOME/ansible_config_playbook"

if ! [ -x "$(python -m pip -V)" ]; then
  python -m ensurepip --upgrade
fi

if ! [ -x "$(ansible --version)" ]; then
  python -m pip install --user ansible
  python -m pip install --upgrade --user ansible
fi

cd "$CONFIG_PLAYBOOK_DIR"

ansible-playbook --diff "$CONFIG_PLAYBOOK_DIR/main.yml"
