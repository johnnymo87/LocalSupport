require 'spec_helper'

require './spec/support/request_spec_helpers'
include RequestSpecHelpers
routes = all_routes

describe 'Redirects', :type => :requests do
  let(:routes) { all_routes }
  let(:user) { FactoryGirl.create :user }
  let(:page_404) { FactoryGirl.create :page_404 }
  before(:each) do
    user.save!
    page_404.save!
  end
  #it 'lets find the main object' do
  #  puts 'hi'
  #  debugger
  #  puts 'bye'
  #end
  routes.each do |route|
    it "#{route[:verb]} #{route[:name]}" do
      request_via_redirect route[:verb], route[:name]
    end
  end

  #it 'get new user session' do
  #  @route = { name: 'new_user_session_path', verb: 'get' }
  #  request_via_redirect :get, user_session_path
  #end
  #

  #it 'each route' do
  #  #puts all_routes
  #  all_routes.each do |route|
  #    print "#{route[:verb]} #{route[:name]} "
  #    request_via_redirect route[:verb], route[:name]
  #    print "#{response.code}\n"
  #    all_routes.pop route
  #  end
  #  raise "untested routes: #{all_routes}" unless all_routes.empty?
  #end

  #it 'get user session path' do
  #  request_via_redirect :get, user_session_path
  #end
  #it 'post user session path' do
  #  request_via_redirect :post, user_session_path, { 'user[email]' => user.email, 'user[password]' => user.password }
  #end
end
