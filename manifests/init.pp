# couchbase
class couchbase {
  include couchbase::params
  require couchbase::repository

  package { $couchbase::params::client_package_name:
    ensure => installed,
  }
}
