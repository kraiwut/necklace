require 'spec_helper'

describe 'user:create:siteadmin' do

  USER_RAKE_SPEC_NAME = "KWA"
  USER_RAKE_SPEC_EMAIL = "kwa@necklace.dev"
  USER_RAKE_SPEC_PASSWORD = "password"

  include_context "rake"

  let(:created_user) { SiteAdmin.find_by_email(USER_RAKE_SPEC_EMAIL) }

	before(:each) do
    ENV.clear
  end

  it "should not create the user without name" do
    ENV['EMAIL'] = USER_RAKE_SPEC_EMAIL
    ENV['PASSWORD'] = USER_RAKE_SPEC_PASSWORD
    SiteAdmin.should_not_receive(:create!)
    subject.invoke
  end

  it "should not create the user without password" do
    ENV['NAME'] = USER_RAKE_SPEC_NAME
    ENV['EMAIL'] = USER_RAKE_SPEC_EMAIL
    SiteAdmin.should_not_receive(:create!)
    subject.invoke
  end

  it "should not create the user without email" do
    ENV['NAME'] = USER_RAKE_SPEC_NAME
    ENV['PASSWORD'] = USER_RAKE_SPEC_PASSWORD
    SiteAdmin.should_not_receive(:create!)
    subject.invoke
  end

  it "should create the user if name, email and password are correct" do
    ENV['NAME'] = USER_RAKE_SPEC_NAME
    ENV['EMAIL'] = USER_RAKE_SPEC_EMAIL
    ENV['PASSWORD'] = USER_RAKE_SPEC_PASSWORD
    subject.invoke
    created_user.should_not be_nil
  end

end