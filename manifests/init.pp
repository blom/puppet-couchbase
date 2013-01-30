# couchbase
class couchbase(
  $package_ensure = present
) {
  include couchbase::params
  include couchbase::repository

  package { $couchbase::params::client_package_name:
    ensure  => $package_ensure,
    require => Class['couchbase::repository'],
  }
}
