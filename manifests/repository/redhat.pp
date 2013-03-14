# couchbase::repository::redhat
class couchbase::repository::redhat(
  $rpm_key_path = "/etc/pki/rpm-gpg/couchbase-rpm.key"
) {
  include couchbase::params

  $os_split = split("$operatingsystemrelease", '[.]')
  case $os_split[0] {
    '5': { $couchbase_os_version = '5.5' }
    '6': { $couchbase_os_version = '6.2' }
  }

  file { $rpm_key_path:
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => "puppet:///modules/couchbase/couchbase-rpm.key",
  }

  exec { "import_rpm_key":
    path      => '/bin:/usr/bin:/sbin:/usr/sbin',
    command   => "rpm --import $rpm_key_path",
    unless    => "rpm -q gpg-pubkey-`$(echo $(gpg --throw-keyids < $rpm_key_path) | cut --characters=11-18 | tr [A-Z] [a-z])`",
    require   => File[$rpm_key_path],
  }

  yumrepo { 'couchbase':
    baseurl        => "http://packages.couchbase.com/rpm/${couchbase_os_version}/${::architecture}",
    failovermethod => 'priority',
    enabled        => '1',
    gpgcheck       => '1',
    gpgkey         => "file://${rpm_key_path}",
    descr          => "Couchbase Packages for Enterprise Linux ${::os_maj_version} - ${::architecture}",
    require        =>  Exec["import_rpm_key"]
  }
}
