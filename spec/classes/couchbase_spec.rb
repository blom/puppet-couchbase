require "spec_helper"

describe "couchbase" do
  it { should include_class "couchbase::params" }
  it { should include_class "couchbase::repository" }

  it { should contain_package("libcouchbase2-core").
              with_ensure("present").
              with_require(/\AClass\[Couchbase::Repository\]/) }

  context "when package_ensure is 'absent'" do
    let(:params) { {:package_ensure => "absent"} }
    it { should contain_package("libcouchbase2-core").with_ensure("absent") }
  end
end
