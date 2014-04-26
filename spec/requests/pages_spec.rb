require 'spec_helper'

describe 'Pages', :helpers => :requests do
  let(:pager) { FactoryGirl.create(:page) }
  let(:user) { FactoryGirl.create(:user, admin: false) }
  let(:post_params) { {page: {name: 'Test Page', permalink: 'test_page', content: 'This is a test'}} }

  before { login(user) }

  it 'except for #show, is restricted non-admin' do
    user.admin = false ; user.save!
    check_routes(:page)

    # get pages_path, {}
    # flash[:error].should_not be_empty
    # post pages_path, post_params
    # flash[:error].should_not be_empty
    # get new_page_path
    # flash[:error].should_not be_empty
    # get edit_page_path, {id: page.id}
    # flash[:error].should_not be_empty
    # get page_path, {id: page.id}
    # flash[:error].should_not be_empty
    # put page_path, {id: page.id}
    # flash[:error].should_not be_empty
    # delete page_path, {id: page.id}
  end

  describe 'POST /pages' do
    it 'creates a new page' do
      -> { post pages_path, post_params }.should change(Page, :count).by(1)
    end
  end

  # describe 'GET /pages/:permalink' do
  #
  #   it 'displays the page content' do
  #     get page_path(page.permalink)
  #     response.should eq ''
  #   end
  # end

  describe 'DELETE /pages/:permalink' do
    it 'destroys the requested page' do
      page # wake up the lazy loading
      -> { delete page_path({id: page.permalink}) }.should change(Page, :count).by(-1)
    end
  end
end