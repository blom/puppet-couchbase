require "spec_helper"

describe "couchbase::repository::debian" do
  let(:baseurl) { "http://packages.couchbase.com/ubuntu" }
  let(:facts) { {:lsbdistid => "Ubuntu", :lsbdistcodename => "lucid"} }

  it { should include_class "couchbase::params" }

  it { should contain_apt__source("couchbase").
              with_location(baseurl).
              with_repos("lucid/main").
              with_key("CD406E62").
              with_key_source("#{baseurl}/couchbase.key").
              with_include_src(false) }
end
