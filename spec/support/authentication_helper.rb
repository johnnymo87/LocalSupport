module ControllerHelpers
  def make_current_user_admin
    admin_user = double("User")
    admin_user.stub(:admin?).and_return(true)
    request.env['warden'].stub :authenticate! => admin_user
    controller.stub(:current_user).and_return(admin_user)
    return admin_user
  end
  def make_current_user_nonadmin
    nonadmin_user = double("User")
    nonadmin_user.stub(:admin?).and_return(false)
    request.env['warden'].stub :authenticate! => nonadmin_user
    controller.stub(:current_user).and_return(nonadmin_user)
    return nonadmin_user
  end
end

module RequestHelpers
  def login(user)
    post_via_redirect user_session_path, 'user[email]' => user.email, 'user[password]' => user.password
  end


  def check_routes(factory)
    include ActionController::UrlFor

    object = FactoryGirl.create(factory)
    param_key = object.class.to_s
    controller_name = object.class.to_s.pluralize.underscore
    attr = attributes_for(factory)


    Rails.application.routes.routes.each do |route|
      if route.defaults[:controller] == controller_name

        # url_for
        route.defaults[:only_path] = true
        path = url_for(route.defaults)

        # verb = find_verb_from(route.verb)
        # path = find_path_from(route.defaults)

        puts 'hi'
        debugger
        puts 'lo'


        case :action
          when 'index' || 'new' then eval("visit '#{path}'")
          when 'create' || 'update' then eval("visit '#{path}', #{{param_key => attr}}")
          when 'show' || 'edit' || 'destroy' then eval("visit '#{path}', #{{:id => object.id}}")
          else next
        end
      end
    end
  end

  # private
  #
  # def find_verb_from(regex)
  #   actions = %w(GET POST PUT DELETE)
  #   actions.select{|a| a.match(regex) }.first.downcase
  # end
  #
  # def find_path_from(action_param)
  #   action_param[:only_path] = true
  #   url_for action_param
  # end
end
