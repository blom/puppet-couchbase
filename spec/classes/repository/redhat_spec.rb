require "spec_helper"

describe "couchbase::repository::redhat" do
  let(:baseurl) { "http://packages.couchbase.com/rpm" }
  let(:facts) { {:architecture => "x86_64", :operatingsystemrelease => "6.0"} }

  it { should include_class "couchbase::params" }

  it { should contain_yumrepo("couchbase").
              with_enabled("1").
              with_gpgcheck("1").
              with_baseurl("#{baseurl}/6.2/x86_64").
              with_gpgkey("#{baseurl}/couchbase-rpm.key").
              with_descr("Couchbase package repository") }

  context "operatingsystemrelease fact" do
    context "5.0" do
      let(:facts) { {:operatingsystemrelease => "5.0"} }
      it { should contain_yumrepo("couchbase").with_baseurl(%r{/5\.5/}) }
    end
  end

  context "architecture fact" do
    context "i386" do
      let(:facts) { {:architecture => "i386"} }
      it { should contain_yumrepo("couchbase").with_baseurl(%r{/i386\z}) }
    end
  end
end
