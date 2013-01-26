require "spec_helper"

describe "couchbase::repository" do
  it { should include_class "couchbase::params" }

  context "operatingsystem fact" do
    context "centos" do
      let(:facts) { {:operatingsystem => "centos"} }

      it { should include_class "couchbase::repository::redhat" }
      it { should_not include_class "couchbase::repository::debian" }
    end

    context "redhat" do
      let(:facts) { {:operatingsystem => "redhat"} }

      it { should include_class "couchbase::repository::redhat" }
      it { should_not include_class "couchbase::repository::debian" }
    end

    context "scientific" do
      let(:facts) { {:operatingsystem => "scientific"} }

      it { should include_class "couchbase::repository::redhat" }
      it { should_not include_class "couchbase::repository::debian" }
    end

    context "debian" do
      let(:facts) {{
        :lsbdistcodename => "null",
        :operatingsystem => "debian",
      }}

      it { should include_class "couchbase::repository::debian" }
      it { should_not include_class "couchbase::repository::redhat" }
    end

    context "ubuntu" do
      let(:facts) {{
        :lsbdistcodename => "null",
        :operatingsystem => "ubuntu",
      }}

      it { should include_class "couchbase::repository::debian" }
      it { should_not include_class "couchbase::repository::redhat" }
    end

    context "null" do
      let(:facts) {{
        :lsbdistcodename => "null",
        :operatingsystem => "null",
      }}

      it { should_not include_class "couchbase::repository::debian" }
      it { should_not include_class "couchbase::repository::redhat" }
    end
  end
end
