require 'spec_helper'

describe "Redirects", :type => :requests do
    it "post user session path" do
      user = FactoryGirl.create :user
      request_via_redirect :post, user_session_path, { 'user[email]' => user.email, 'user[password]' => user.password }
    end
end
