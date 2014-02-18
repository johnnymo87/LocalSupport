require 'spec_helper'

#require './spec/support/request_spec_helpers'
#include RequestSpecHelpers
#routes = all_routes
#puts routes

describe 'Redirects', :type => :requests do
  after(:all) { unchecked_routes.should be_empty, "expected empty array, instead got #{unchecked_routes.inspect}" }
  let(:user) { FactoryGirl.create :user }
  #let(:page_404) { FactoryGirl.create :page_404 }
  #let(:routes) { all_routes }

  it 'get /users/sign_in' do
    get_via_redirect new_user_session_path
  end

  it 'post /users/sign_in' do
    post_via_redirect user_session_path, { 'user[email]' => user.email, 'user[password]' => user.password }
  end

  it 'delete /users/sign_out'

  it 'get /users/password'

  it 'get /users/password/new'

  it 'get /users/password/edit'

  it 'put /users/password'

  it 'get /users/cancel'

  it 'post /users'

  it 'get /users/sign_up'

  it 'get /users/edit'

  it 'put /users'

  it 'delete /users'

  it 'post /users/confirmation'

  it 'post /users/password'

  it 'post /users/password'

  it 'post /users/password'

  it 'post /users/password'

  it 'post /users/password'

  it 'post /users/password'

  it 'post /users/password'

  it 'post /users/password'

  it 'post /users/password'

  it 'post /users/password'

  it 'post /users/password'

  it 'post /users/password'

  it 'post /users/password'

  it 'post /users/password'

  it 'post /users/password'

  it 'post /users/password'

  it 'post /users/password'

  it 'post /users/password'

  it 'post /users/password'

  it 'post /users/password'

  it 'post /users/password'

  [ "", "", "", "", "", "", "", "", "", "", "get /users/confirmation/new", "get /users/confirmation", "get /contributors", "get /organizations/search", "put /organizations/:organization_id/user/:id", "get /orphans", "post /orphans", "get /users", "put /users/:id", "get /organizations", "post /organizations", "get /organizations/new", "get /organizations/:id/edit", "get /organizations/:id", "put /organizations/:id", "delete /organizations/:id", "get /:id", "put /:id", "delete /:id", "post /cookies/allow", "get /"]


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

  #before(:each) do
  #  #puts 'hi'
  #  #debugger
  #  user.save!
  #  page_404.save!
  #end
  #rake_routes.each do |route|
  #  it "#{route[:verb]} #{route[:name]}" do
  #    #puts 'hi'
  #    #debugger
  #    request_via_redirect route[:verb], eval(route[:name]), route[:params]
  #  end
  #end

  #let(:routes) { [
  #    {:name=>"new_user_session_path", :verb=>"get"},
  #    {:name=>"user_session_path", :verb=>"post", :params=>{ 'user[email]' => user.email, 'user[password]' => user.password }},
  #    {:name=>"destroy_user_session_path", :verb=>"delete"},
  #    {:name=>"user_password_path", :verb=>"post"},
  #    {:name=>"new_user_password_path", :verb=>"get"},
  #    {:name=>"edit_user_password_path", :verb=>"get"},
  #    {:name=>"edit_user_password_path", :verb=>"put"},
  #    {:name=>"cancel_user_registration_path", :verb=>"get"},
  #    {:name=>"user_registration_path", :verb=>"post"},
  #    {:name=>"new_user_registration_path", :verb=>"get"},
  #    {:name=>"edit_user_registration_path", :verb=>"get"},
  #    {:name=>"edit_user_registration_path", :verb=>"put"},
  #    {:name=>"edit_user_registration_path", :verb=>"delete"},
  #    {:name=>"user_confirmation_path", :verb=>"post"},
  #    {:name=>"new_user_confirmation_path", :verb=>"get"},
  #    {:name=>"new_user_confirmation_path", :verb=>"get"},
  #    {:name=>"contributors_path", :verb=>"get"},
  #    {:name=>"organizations_search_path", :verb=>"get"},
  #    {:name=>"organizations_search_path", :verb=>"put"},
  #    {:name=>"orphans_path", :verb=>"get"},
  #    {:name=>"orphans_path", :verb=>"post"},
  #    {:name=>"users_path", :verb=>"get"},
  #    {:name=>"user_path", :verb=>"put"},
  #    {:name=>"organizations_path", :verb=>"get"},
  #    {:name=>"organizations_path", :verb=>"post"},
  #    {:name=>"new_organization_path", :verb=>"get"},
  #    {:name=>"edit_organization_path", :verb=>"get"},
  #    {:name=>"organization_path", :verb=>"get"},
  #    {:name=>"organization_path", :verb=>"put"},
  #    {:name=>"organization_path", :verb=>"delete"},
  #    {:name=>"page_path", :verb=>"get"},
  #    {:name=>"page_path", :verb=>"put"},
  #    {:name=>"page_path", :verb=>"delete"},
  #    {:name=>"cookies_allow_path", :verb=>"post"},
  #    {:name=>"root_path", :verb=>"get"}
  #]}
end
