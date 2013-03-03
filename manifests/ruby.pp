# couchbase::ruby
class couchbase::ruby(
  $package_ensure = present
) {
  include couchbase::params
  include couchbase::dev

  package { 'couchbase':
    ensure   => $package_ensure,
    provider => 'gem',
    require  => Class['couchbase::dev'],
  }
}
