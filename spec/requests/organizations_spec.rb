require 'spec_helper'

describe 'Organizations', :helpers => :requests do

  # def check_routes(factory)
  #   include ActionController::UrlFor
  #
  #   %w( index new create show edit update destroy )
  #   object = FactoryGirl.create(factory)
  #   param_key = object.class.to_s
  #   controller_name = object.class.to_s.pluralize.underscore
  #   attr = attributes_for(factory)
  #   Rails.application.routes.routes.each do |route|
  #     if route.defaults[:controller] == controller_name
  #       route.defaults[:only_path] = true
  #       debugger
  #       url_for
  #
  #       path = url_for(route.defaults)
  #       case :action
  #         when 'index' || 'new' then eval("visit '#{path}'")
  #         when 'create' || 'update' then eval("visit '#{path}', #{{param_key => attr}}")
  #         when 'show' || 'edit' || 'destroy' then eval("visit '#{path}', #{{:id => object.id}}")
  #         else next
  #       end
  #     end
  #   end
  #
  # end

  it '' do
    check_routes :page
  end
end
