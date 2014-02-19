require 'spec_helper'

describe 'Redirects', :type => :requests do
  let(:user) { FactoryGirl.create :user }

  it 'get /users/sign_in' do
    get_via_redirect '/users/sign_in', {}
  end

  it 'post /users/sign_in' do
    post_via_redirect '/users/sign_in', { 'user[email]' => user.email, 'user[password]' => user.password }
  end

  it 'delete /users/sign_out' do
    delete_via_redirect '/users/sign_out', {}
  end

  it 'post /users/password' do
    post_via_redirect '/users/password', {}
  end

  it 'get /users/password/new' do
    get_via_redirect '/users/password/new', {}
  end

  it 'get /users/password/edit' do
    get_via_redirect '/users/password/edit', {}
  end

  it 'put /users/password' do
    put_via_redirect '/users/password', {}
  end

  it 'get /users/cancel' do
    get_via_redirect '/users/cancel', {}
  end

  it 'post /users' do
    post_via_redirect '/users', {}
  end

  it 'get /users/sign_up' do
    get_via_redirect '/users/sign_up', {}
  end

  it 'get /users/edit' do
    get_via_redirect '/users/edit', {}
  end

  it 'put /users' do
    put_via_redirect '/users', {}
  end

  it 'delete /users' do
    delete_via_redirect '/users', {}
  end

  it 'post /users/confirmation' do
    post_via_redirect '/users/confirmation', {}
  end

  it 'get /users/confirmation/new' do
    get_via_redirect '/users/confirmation/new', {}
  end

  it 'get /users/confirmation' do
    get_via_redirect '/users/confirmation', {}
  end

  it 'get /contributors' do
    get_via_redirect '/contributors', {}
  end

  it 'get /organizations/search' do
    get_via_redirect '/organizations/search', {}
  end

  it 'put /organizations/:organization_id/user/:id' do
    put_via_redirect '/organizations/:organization_id/user/:id', {}
  end

  it 'get /orphans' do
    get_via_redirect '/orphans', {}
  end

  it 'post /orphans' do
    post_via_redirect '/orphans', {}
  end

  it 'get /users' do
    get_via_redirect '/users', {}
  end

  it 'put /users/:id' do
    put_via_redirect '/users/:id', {}
  end

  it 'get /organizations' do
    get_via_redirect '/organizations', {}
  end

  it 'post /organizations' do
    post_via_redirect '/organizations', {}
  end

  it 'get /organizations/new' do
    get_via_redirect '/organizations/new', {}
  end

  it 'get /organizations/:id/edit' do
    get_via_redirect '/organizations/:id/edit', {}
  end

  it 'get /organizations/:id' do
    get_via_redirect '/organizations/:id', {}
  end

  it 'put /organizations/:id' do
    put_via_redirect '/organizations/:id', {}
  end

  it 'delete /organizations/:id' do
    delete_via_redirect '/organizations/:id', {}
  end

  it 'get /:id' do
    get_via_redirect '/:id', {}
  end

  it 'put /:id' do
    put_via_redirect '/:id', {}
  end

  it 'delete /:id' do
    delete_via_redirect '/:id', {}
  end

  it 'post /cookies/allow' do
    post_via_redirect '/cookies/allow', {}
  end

  it 'get /' do
    get_via_redirect '/', {}
  end

  after(:all) { unchecked_routes.should be_empty, "expected empty array, instead got #{unchecked_routes.inspect}" }
end
