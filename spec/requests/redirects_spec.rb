require 'spec_helper'

describe 'Redirects', :type => :requests do
  let(:user) { FactoryGirl.create :user }

  it 'get /users/sign_in' do
    get_via_redirect new_user_session_path, {}
  end

  it 'post /users/sign_in' do
    post_via_redirect user_session_path, { 'user[email]' => user.email, 'user[password]' => user.password }
  end

  it 'delete /users/sign_out' do
    delete_via_redirect destroy_user_session_path, {}
  end

  it 'post /users/password' do
    post_via_redirect user_password_path, {}
  end

  it 'get /users/password/new' do
    get_via_redirect new_user_password_path, {}
  end

  it 'get /users/password/edit' do
    get_via_redirect edit_user_password_path, {}
  end

  it 'put /users/password' do
    put_via_redirect edit_user_password_path, {}
  end

  it 'get /users/cancel' do
    get_via_redirect cancel_user_registration_path, {}
  end

  it 'post /users' do
    post_via_redirect user_registration_path, {}
  end

  it 'get /users/sign_up' do
    get_via_redirect new_user_registration_path, {}
  end

  it 'get /users/edit' do
    get_via_redirect edit_user_registration_path, {}
  end

  it 'put /users' do
    put_via_redirect edit_user_registration_path, {}
  end

  it 'delete /users' do
    delete_via_redirect edit_user_registration_path, {}
  end

  it 'post /users/confirmation' do
    post_via_redirect user_confirmation_path, {}
  end

  it 'get /users/confirmation/new' do
    get_via_redirect new_user_confirmation_path, {}
  end

  it 'get /users/confirmation' do
    get_via_redirect new_user_confirmation_path, {}
  end

  it 'get /contributors' do
    get_via_redirect contributors_path, {}
  end

  it 'get /organizations/search' do
    get_via_redirect organizations_search_path, {}
  end

  it 'put /organizations/:organization_id/user/:id' do
    put_via_redirect organizations_search_path, {}
  end

  it 'get /orphans' do
    get_via_redirect orphans_path, {}
  end

  it 'post /orphans' do
    post_via_redirect orphans_path, {}
  end

  it 'get /users' do
    get_via_redirect users_path, {}
  end

  it 'put /users/:id' do
    put_via_redirect user_path, {}
  end

  it 'get /organizations' do
    get_via_redirect organizations_path, {}
  end

  it 'post /organizations' do
    post_via_redirect organizations_path, {}
  end

  it 'get /organizations/new' do
    get_via_redirect new_organization_path, {}
  end

  it 'get /organizations/:id/edit' do
    get_via_redirect edit_organization_path, {}
  end

  it 'get /organizations/:id' do
    get_via_redirect organization_path, {}
  end

  it 'put /organizations/:id' do
    put_via_redirect organization_path, {}
  end

  it 'delete /organizations/:id' do
    delete_via_redirect organization_path, {}
  end

  it 'get /:id' do
    get_via_redirect page_path, {}
  end

  it 'put /:id' do
    put_via_redirect page_path, {}
  end

  it 'delete /:id' do
    delete_via_redirect page_path, {}
  end

  it 'post /cookies/allow' do
    post_via_redirect cookies_allow_path, {}
  end

  it 'get /' do
    get_via_redirect root_path, {}
  end

  after(:all) { unchecked_routes.should be_empty, "expected empty array, instead got #{unchecked_routes.inspect}" }
end
