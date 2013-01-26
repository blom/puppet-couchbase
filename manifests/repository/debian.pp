# couchbase::repository::debian
class couchbase::repository::debian {
  include couchbase::params

  apt::key { 'couchbase':
    key        => 'CD406E62',
    key_source => 'http://packages.couchbase.com/ubuntu/couchbase.key',
  }

  apt::source { 'couchbase':
    location    => downcase("http://packages.couchbase.com/${::lsbdistid}"),
    repos       => "${::lsbdistcodename}/main",
    include_src => false,
    require     => Apt::Key['couchbase'],
  }
}
