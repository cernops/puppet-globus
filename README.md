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
* `name_compatibility` Must be one of *HYBRID*, *STRICT_RFC2818* or *STRICT_GT2*, defaults to *STRICT_RFC2818*.
* `ciphers` An array of *CIPHERS* , defaults to *HIGH*.
* `server_cipher_order`, boolean, defaults to true.

