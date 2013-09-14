# couchbase::params
class couchbase::params {
  $client_package_name = 'libcouchbase2-core'
  $server_package_name = 'couchbase-server'
  $server_service_name = 'couchbase-server'

  $dev_package_name = $::operatingsystem ? {
    /(?i:centos|redhat|scientific)/ => 'libcouchbase-devel',
    default                         => 'libcouchbase-dev',
  }
}
