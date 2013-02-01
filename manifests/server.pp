# couchbase::server
class couchbase::server(
  $package_ensure = present,
  $service_enable = true,
  $service_ensure = undef
) {
  include couchbase::params
  include couchbase::repository

  package { $couchbase::params::server_package_name:
    ensure  => $package_ensure,
    require => Class['couchbase::repository'],
  }

  service { $couchbase::params::server_service_name:
    ensure     => $service_ensure,
    enable     => $service_enable,
    hasrestart => true,
    require    => Package[$couchbase::params::server_package_name],
  }
}
