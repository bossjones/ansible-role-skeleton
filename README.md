# ansible-role-skeleton

[![Build Status](https://travis-ci.org/systemli/ansible-role-skeleton.svg?branch=master)](https://travis-ci.org/systemli/ansible-role-skeleton) [![Ansible Galaxy](http://img.shields.io/badge/ansible--galaxy-skeleton-blue.svg)](https://galaxy.ansible.com/systemli/skeleton/)

We try to open source as much as possible of our infrastructure and services. This skeleton contains all basic information we use to develop and test [Ansible](https://www.ansible.com/) roles. You can easily use it to start developing new roles or add testing to old ones.

## Usage

    # init a new role
    ./init-role.sh /path/to/new-role

    # update an existing role
    ./update-role.sh /path/to/role

## Testing

Make sure your user is in the `docker` group. To only test your current setup, do

    molecule test

To test different versions of ansible, do

    tox

If your role depends on other roles from [Ansible Galaxy](https://galaxy.ansible.com/), uncomment the dependency lines in `molecule.yml` and add the dependencies in `tests/requirements.yml`.

## License

GPL

## Author Information

https://www.systemli.org
