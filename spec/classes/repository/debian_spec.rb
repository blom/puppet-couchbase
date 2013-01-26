require "spec_helper"

describe "couchbase::repository::debian" do
  let(:facts) { {:lsbdistcodename => "null"} }

  it { should include_class "couchbase::params" }

  it { should contain_apt__key('couchbase') }
  it { should contain_apt__source('couchbase') }
end
