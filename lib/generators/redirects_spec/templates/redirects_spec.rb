require 'spec_helper'

describe 'Redirects', :type => :requests do
  <% all_routes.each do |route| %>
    <%= "it '#{route[:verb]} #{route[:path]}' do" %>
    <%= "  #{route[:verb]}_via_redirect #{route[:path]}, {}" %>
    <%= "end" %>
  <% end %>
  after(:all) { unchecked_routes.should be_empty, "expected empty array, instead got #{unchecked_routes.inspect}" }
end
