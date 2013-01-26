# couchbase::server
class couchbase::server {
  include couchbase::params
  require couchbase::repository

  package { $couchbase::params::server_package_name:
    ensure => installed,
  }
}
