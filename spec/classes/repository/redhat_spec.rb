require "spec_helper"

describe "couchbase::repository::redhat" do
  it { should include_class "couchbase::params" }
end
