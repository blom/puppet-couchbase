# couchbase::server
class couchbase::server(
  $package_ensure = present
) {
  include couchbase::params
  require couchbase::repository

  package { $couchbase::params::server_package_name:
    ensure => $package_ensure,
  }
}
