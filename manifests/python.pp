# couchbase::python
class couchbase::python(
  $package_ensure = present
) {
  include couchbase::params
  include couchbase::dev

  package { 'couchbase_python':
    ensure   => $package_ensure,
    name     => 'couchbase',
    provider => 'pip',
    require  => Class['couchbase::dev'],
  }
}
