[![Puppet Forge](http://img.shields.io/puppetforge/v/CERNOps/globus.svg)](https://forge.puppetlabs.com/CERNOps/globus)
[![Build Status](https://travis-ci.org/cernops/puppet-globus.svg?branch=master)](https://travis-ci.org/cernops/puppet-globus)
# CERNOps-globus

## Overview

Installs globus packages and configures them.

## Setup

### What globus affects

* Installs the package *globus-gssapi-gsi*
* Completly controls the file */etc/grid-security/gsi.conf*


## Usage

```puppet
class{'globus':
  name_compatibility  => 'HYBRID'
}
```

### Parameters for Globus Class
* `gssapi_gsi_pkgversion` Package ensure value for *globus-gssapi-gsi*, defaults to *present*.
* `force_tls` Sets the *FORCE_TLS* value in gsi.conf, defaults to *false*.
* `name_compatibility` Must be one of *HYBRID*, *STRICT_RFC2818* or *STRICT_GT2*, defaults to *STRICT_RFC2818* for gsi.conf.
* `ciphers` An array of *CIPHERS* , defaults to *HIGH* for gsi.conf
* `server_cipher_order`, boolean, defaults to true for gsi.conf

### Tests
To run standalone tests

```bash
bundle install
bundle exec rake validate
bundle exec rake lint
bundle exec rake spec
```

The acceptance tests by default use vagrant
and vargrant-libvirtd so ensure they are working
or provide beaker configuration for your own
hypervisor.

This example mutates the virtualbox images from
puppetlabs into ones suitable for libvirt.

```bash
vagrant plugin install vagrant-mutate
vagrant mutate https://vagrantcloud.com/puppetlabs/boxes/centos-6.6-64-nocm/versions/1.0.1/providers/virtualbox.box libvirt
vagrant box repackage virtualbox libvirt 0
vagrant box add puppetlabs/centos-6.6-64-nocm ./package.box
bundle install
BEAKER_debug=yes bundle exec rspec spec/acceptance
# or with docker
BEAKER_debug=yes BEAKER_setfile=spec/acceptance/nodesets/docker.yml bundle exec rspec spec/acceptance
```


## License
Apache II License for all files. 

## Contact
Steve Traylen <steve.traylen@cern.ch>

## Support
https://github.com/cernops/puppet-globus

