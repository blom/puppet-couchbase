require "spec_helper"

describe "couchbase::server" do
  it { should include_class "couchbase::params" }
  it { should include_class "couchbase::repository" }
  it { should contain_package("couchbase-server").with_ensure("installed") }

  context "when package_ensure is 'absent'" do
    let(:params) { {:package_ensure => "absent"} }
    it { should contain_package("couchbase-server").with_ensure("absent") }
  end
end
