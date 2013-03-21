require "spec_helper"

describe "couchbase::dev" do
  let(:facts) {{
    :lsbdistcodename => "precise",
    :operatingsystem => "Ubuntu",
  }}

  it { should include_class "couchbase::params" }
  it { should include_class "couchbase::repository" }

  it { should contain_package("libcouchbase-dev").
              with_ensure("present").
              with_require(/\AClass\[Couchbase::Repository\]/) }

  context "when package_ensure is 'absent'" do
    let(:params) { {:package_ensure => "absent"} }
    it { should contain_package("libcouchbase-dev").with_ensure("absent") }
  end

  context "operatingsystem fact" do
    context "CentOS" do
      let(:facts) { {:operatingsystem => "CentOS"} }
      it { should contain_package("libcouchbase-devel") }
    end

    context "RedHat" do
      let(:facts) { {:operatingsystem => "RedHat"} }
      it { should contain_package("libcouchbase-devel") }
    end

    context "Scientific" do
      let(:facts) { {:operatingsystem => "Scientific"} }
      it { should contain_package("libcouchbase-devel") }
    end
  end
end
