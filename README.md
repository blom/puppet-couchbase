puppet-couchbase
================

[![Build Status](https://travis-ci.org/blom/puppet-couchbase.png)](https://travis-ci.org/blom/puppet-couchbase)

* [Homepage](https://github.com/blom/puppet-couchbase)
* [Puppet Forge](https://forge.puppetlabs.com/blom/couchbase)

Puppet module for [Couchbase][1].

Currently only confirmed to work on Ubuntu 10.04 LTS.

Installation
------------

    puppet module install blom/couchbase

Usage
-----

### couchbase

Installs the Couchbase client library.

    class { 'couchbase':
    }

Takes the following optional attributes:

* `package_ensure`: The `ensure` passed to `package` (default: `present`).

### couchbase::dev

Installs the Couchbase development files.

    class { 'couchbase::dev':
    }

Takes the following optional attributes:

* `package_ensure`: The `ensure` passed to `package` (default: `present`).

### couchbase::ruby

Installs the Couchbase Ruby client library.

    class { 'couchbase::ruby':
    }

Takes the following optional attributes:

* `package_ensure`: The `ensure` passed to `package` (default: `present`).

### couchbase::server

Installs the Couchbase server.

    class { 'couchbase::server':
    }

Takes the following optional attributes:

* `package_ensure`: The `ensure` passed to `package` (default: `present`).
* `service_enable`: The `enable` passed to `service` (default: `true`).
* `service_ensure`: The `ensure` passed to `service` (default: `undef`).

[1]: http://www.couchbase.com/
