# couchbase
class couchbase(
  $package_ensure = present
) {
  include couchbase::params
  require couchbase::repository

  package { $couchbase::params::client_package_name:
    ensure => $package_ensure,
  }
}
