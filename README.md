# Ansible Unison Role

[![Build Status](https://img.shields.io/travis/weareinteractive/ansible-unison.svg)](https://travis-ci.org/weareinteractive/ansible-unison)
[![Galaxy](http://img.shields.io/badge/galaxy-franklinkim.unison-blue.svg)](https://galaxy.ansible.com/list#/roles/4107)
[![GitHub Tags](https://img.shields.io/github/tag/weareinteractive/ansible-unison.svg)](https://github.com/weareinteractive/ansible-unison)
[![GitHub Stars](https://img.shields.io/github/stars/weareinteractive/ansible-unison.svg)](https://github.com/weareinteractive/ansible-unison)

> `unison` is an [ansible](http://www.ansible.com) role which:
>
> * installs unison
> * configures unison

## Installation

Using `ansible-galaxy`:

```
$ ansible-galaxy install franklinkim.unison
```

Using `requirements.yml`:

```
- src: franklinkim.unison
```

Using `git`:

```
$ git clone https://github.com/weareinteractive/ansible-unison.git franklinkim.unison
```

## Dependencies

* Ansible >= 1.9

## Variables

Here is a list of all the default variables for this role, which are also available in `defaults/main.yml`.

```
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

## Example playbook

```
- hosts: all
  sudo: yes
  roles:
    - franklinkim.unison
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

```
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

## License
Copyright (c) We Are Interactive under the MIT license.
