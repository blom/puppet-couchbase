# couchbase::server
class couchbase::server(
  $package_ensure = present,
  $service_enable = true
) {
  include couchbase::params
  require couchbase::repository

  package { $couchbase::params::server_package_name:
    ensure => $package_ensure,
  }

  service { $couchbase::params::server_service_name:
    enable => $service_enable,
  }
}
