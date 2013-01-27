puppet-couchbase
================

[![Build Status](https://secure.travis-ci.org/blom/puppet-couchbase.png)](https://travis-ci.org/blom/puppet-couchbase)

* [Homepage](https://github.com/blom/puppet-couchbase)

Puppet module for [Couchbase][1].

Currently only confirmed to work on Ubuntu 10.04 LTS; waiting for
[repositories](http://www.couchbase.com/issues/browse/MB-6972) to become
available.

Usage
-----

### couchbase

Installs the Couchbase client library.

    class { 'couchbase':
    }

### couchbase::server

Installs the Couchbase server.

    class { 'couchbase::server':
    }

[1]: http://www.couchbase.com/
