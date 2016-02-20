# Ansible weareinteractive.unison role

[![Build Status](https://img.shields.io/travis/weareinteractive/ansible-unison.svg)](https://travis-ci.org/weareinteractive/ansible-unison)
[![Galaxy](http://img.shields.io/badge/galaxy-weareinteractive.unison-blue.svg)](https://galaxy.ansible.com/weareinteractive/unison)
[![GitHub Tags](https://img.shields.io/github/tag/weareinteractive/ansible-unison.svg)](https://github.com/weareinteractive/ansible-unison)
[![GitHub Stars](https://img.shields.io/github/stars/weareinteractive/ansible-unison.svg)](https://github.com/weareinteractive/ansible-unison)

> `weareinteractive.unison` is an [Ansible](http://www.ansible.com) role which:
>
> * installs unison
> * configures unison

**Note:**

> Since Ansible Galaxy supports [organization](https://www.ansible.com/blog/ansible-galaxy-2-release) now, this role has moved from `franklinkim.unison` to `weareinteractive.unison`!

## Installation

Using `ansible-galaxy`:

```shell
$ ansible-galaxy install weareinteractive.unison
```

Using `requirements.yml`:

```yaml
- src: weareinteractive.unison
```

Using `git`:

```shell
$ git clone https://github.com/weareinteractive/ansible-unison.git weareinteractive.unison
```

## Dependencies

* Ansible >= 2.0

## Variables

Here is a list of all the default variables for this role, which are also available in `defaults/main.yml`.

```yaml
---
# unison_configs:
#   - name: sync1
#     # Two root directories to sync.
#     src: /home/unison
#     dest: ssh://dev.null/home/unison
#     # If you want Unison to run without any user input, try "batch" mode.
#     batch: yes
#     # If you don't want to be prompted, and just accept Unison's recommendation:
#     auto: yes
#     # Optionally, you can sync specific sub directories only (under the root).
#     paths: []
#     # Optionally, you can ignore specific files or directories that are matched with regular expressions.
#     ignore: []
#     # If you want to ignore difference in file props:
#     perms: 0
#

# list of configs
unison_configs: []
# unison user name (string | false)
unison_user: unison
# path to configs
unison_config_path: "/home/{{ unison_user }}/.unison"
# package name (version)
unison_package: unison

```


## Usage

This is an example playbook:

```yaml
---

- hosts: all
  # pre_tasks for installing dependencies for running the tests within docker
  pre_tasks:
    - name: Installing openssh
      action: "{{ ansible_pkg_mgr }} pkg=openssh-client state=present"
  roles:
    - weareinteractive.unison
  vars:
    unison_configs:
      - name: sync
        src: /home/unison
        dest: ssh://dev.nul/home/unison
        ignore:
          - ".*"
          - "~*"

```


## Testing

```shell
$ git clone https://github.com/weareinteractive/ansible-unison.git
$ cd ansible-unison
$ vagrant up
```

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests and examples for any new or changed functionality.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

*Note: To update the `README.md` file please install and run `ansible-role`:*

```shell
$ gem install ansible-role
$ ansible-role docgen
```

## License
Copyright (c) We Are Interactive under the MIT license.
