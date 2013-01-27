require "spec_helper"

describe "couchbase" do
  it { should include_class("couchbase::params") }
  it { should include_class "couchbase::repository" }
  it { should contain_package("libcouchbase2").with_ensure("installed") }
end
