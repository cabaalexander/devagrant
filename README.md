<h1 align="center">devagrant</h1>

<div align="center">
  <img src="/img/logo.png" />
</div>

<div align="center">
  <p>Vagrant machine to be used as a develop environment.</p>

  </p>Based on TMUX + VIM</p>
</div>


### System specifications

- OS: [ubuntu/xenial64](https://app.vagrantup.com/ubuntu/boxes/xenial64)
- Default apps
  - tree
  - git
  - tmux
  - python3-pip
  - [neovim](https://neovim.io/)

TMUX Plugins
[Read at the .tmux.conf](/sync/dot-files/tmux.conf)

NVIM Plugins
[Read at the pluginmanager.vim](/sync/nvim/plugins/pluginmanager.vim)

### File Structure

    .
    ├── config                                  # sensitive data goes here sshhh...
    │   ├── dot-files
    │   └── ssh
    ├── provisions                              # instalation files
    │   ├── after.sh
    │   ├── cpssh.sh
    │   ├── sudo.sh
    │   ├── symlink.sh
    │   └── user
    ├── sync                                    # synchronization files
    |   ├── bin
    |   ├── dot-files
    |   └── nvim
    └── Vagrantfile

### Requirements

Know VIM and TMUX :'V

### Usage

```bash
# This will be shared at `/projects/` on the guest machine
$ PROJECTS="projects/directory/on/host/machine"
$ vagrant up
```

