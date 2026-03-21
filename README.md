# Linux Configs

This simple repo contains very, very simple bash scripts for linux and fedora, or fedora based-distributions

```bash
#
# Loading user configs
#
if [ -f /{path}/linux-configs/configs.sh ]; then
    echo "Loading user configs"
    . /{path}/linux-configs/configs.sh
fi
if test -d "/{path}/linux-configs/scripts"; then
    echo "Exporting scripts"
    export PATH="/{path}/linux-configs/scripts:$PATH"
fi
#
# User configs loaded
#
```

The following is an actual example of this, in the case on which the current repo is located in the user's home directory, in a sub-directory called `repos`.

```bash
#
# Loading user configs
#
if [ -f /home/fish/repos/linux-configs/configs.sh ]; then
    echo "Loading user configs"
    . /home/fish/repos/linux-configs/configs.sh
fi
if test -d "/home/fish/repos/linux-configs/scripts"; then
    echo "Exporting scripts"
    export PATH="/home/fish/repos/linux-configs/scripts:$PATH"
fi
#
# User configs loaded
#

```

To create a new script, and make it executable, run the command: `chmod u+x <filename.sh>`, for example:

```bash
chmod u+x install-all-the-things.sh
```
