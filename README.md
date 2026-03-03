# Linux Configs

This simple repo contains very, very simple bash scripts for linux and fedora, or fedora based-distributions

```bash
#
# Loading user configs
#
if [ -f /home/{user}/repos/linux-configs/configs.sh ]; then
    echo "Loading user configs"
    . /home/{user}/repos/linux-configs/configs.sh
fi
if test -d "/home/{user}/repos/linux-configs/scripts"; then
    echo "Exporting scripts"
    export PATH="/home/{user}/repos/linux-configs/scripts:$PATH"
fi
#
# User configs loaded
#
```
