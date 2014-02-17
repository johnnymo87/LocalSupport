require 'spec_helper'

describe "Organizations" do
  describe "GET /organizations" do
    it "works! (now write some real specs)" do
      user = FactoryGirl.create :user
      # post_via_redirect
      post user_session_path, 'user[email]' => user.email, 'user[password]' => user.password
    end
  end
end
