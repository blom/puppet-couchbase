# couchbase::repository
class couchbase::repository {
  include couchbase::params

  case $::operatingsystem {
    centos, redhat, scientific: { include couchbase::repository::redhat }
    debian, ubuntu: { include couchbase::repository::debian }
    default: { }
  }
}
