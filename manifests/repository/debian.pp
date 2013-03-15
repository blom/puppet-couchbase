# couchbase::repository::debian
class couchbase::repository::debian {
  include couchbase::params

  apt::source { 'couchbase':
    location    => downcase("http://packages.couchbase.com/${::lsbdistid}"),
    repos       => "${::lsbdistcodename}/main",
    key         => 'CD406E62',
    key_source  => 'http://packages.couchbase.com/ubuntu/couchbase.key',
    include_src => false,
  }
}
