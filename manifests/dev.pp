# couchbase::dev
class couchbase::dev(
  $package_ensure = present
) {
  include couchbase::params
  include couchbase::repository

  package { $couchbase::params::dev_package_name:
    ensure  => $package_ensure,
    require => Class['couchbase::repository'],
  }
}
