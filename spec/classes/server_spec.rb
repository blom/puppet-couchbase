require "spec_helper"

describe "couchbase::server" do
  it { should include_class "couchbase::params" }
  it { should include_class "couchbase::repository" }

  it { should contain_package("couchbase-server").
              with_ensure("present").
              with_require(/\AClass\[Couchbase::Repository\]/) }

  it { should contain_service("couchbase-server").
              without_ensure.
              with_enable(true).
              with_hasrestart(true).
              with_require(/\APackage\[couchbase-server\]/) }

  context "when package_ensure is 'absent'" do
    let(:params) { {:package_ensure => "absent"} }
    it { should contain_package("couchbase-server").with_ensure("absent") }
  end

  context "when service_enable is 'false'" do
    let(:params) { {:service_enable => false} }
    it { should contain_service("couchbase-server").with_enable(false) }
  end

  context "when service_ensure is 'running'" do
    let(:params) { {:service_ensure => "running"} }
    it { should contain_service("couchbase-server").with_ensure("running") }
  end
end
