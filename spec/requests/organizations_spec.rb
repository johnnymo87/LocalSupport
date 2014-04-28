require 'spec_helper'

describe 'Organizations', :helpers => :requests do
  extend RequestHelpers
  instance = Organization.create!
  accessible_attrs = FactoryGirl.attributes_for :organization

  let(:non_admin) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:user, email: 'admin@example.com', admin: true) }

  it 'test' do
    puts 'hi'
    debugger
    puts 'lo'
  end

  describe 'admin can access all API actions' do
    let(:org) { FactoryGirl.create(:organization) }
    before { login(admin) }

    for_actions_in(OrganizationsController, instance, accessible_attrs, :only => [:update]) do |action, command|
      it "admin can access #{action}" do
        # puts 'hi'
        # debugger
        # puts 'lo'

        eval(command)
        response.status.should be 200
        flash[:error].should be nil
        # request_via_redirect
      end
    end
  end

end