# couchbase::ruby
class couchbase::ruby(
  $package_ensure = present
) {
  include couchbase::params
  include couchbase::dev

  package { 'couchbase_ruby':
    ensure   => $package_ensure,
    name     => 'couchbase',
    provider => 'gem',
    require  => Class['couchbase::dev'],
  }
}
