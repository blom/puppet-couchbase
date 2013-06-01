puppet-couchbase
================

[![Build Status](https://travis-ci.org/blom/puppet-couchbase.png)](https://travis-ci.org/blom/puppet-couchbase)

* [Homepage](https://github.com/blom/puppet-couchbase)
* [Puppet Forge](https://forge.puppetlabs.com/blom/couchbase)

Puppet module for [Couchbase][1].

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

### couchbase::python

Installs the Couchbase Python client library.

    class { 'couchbase::python':
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

The repositories for Couchbase server is currently (2013-04-24)
[a work in progress](http://www.couchbase.com/issues/browse/MB-6972) and
`couchbase::server` is considered experimental.

Contributors
------------

See the [contributors page][2] for a list of contributors.

[1]: http://www.couchbase.com/
[2]: https://github.com/blom/puppet-couchbase/contributors
