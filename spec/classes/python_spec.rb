require "spec_helper"

describe "couchbase::python" do
  it { should include_class "couchbase::params" }
  it { should include_class "couchbase::dev" }

  it { should contain_package("couchbase_python").
              with_ensure("present").
              with_name("couchbase").
              with_provider("pip").
              with_require(/\AClass\[Couchbase::Dev\]/) }

  context "when package_ensure is 'absent'" do
    let(:params) { {:package_ensure => "absent"} }
    it { should contain_package("couchbase_python").with_ensure("absent") }
  end
end
