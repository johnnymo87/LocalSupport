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

  def for_actions_in(controller, instance, access_attrs, options = {})
    tapper ||= RouteTapper.new(self, controller, instance, access_attrs, options)
    # tapper.anonymize_controller
    tapper.actions.each_pair do |action, command|
      yield(action, command)
      # eval("#{verb} :#{action}")
      # yield
    end
  end

  class RouteTapper
    include Rails.application.routes.url_helpers

    attr_reader :actions

    def initialize(context, controller, instance, access_attrs, options = {})
      @controller_name = controller.to_s.chomp('Controller').downcase

      routes = Rails.application.routes.routes.select do |route|
        route.defaults[:controller] == @controller_name
      end

      @instance = instance

      @access_attrs = access_attrs

      @context = context

      @options = options

      @actions = routes.each_with_object({}) do |route, hsh|
        # puts 'hi'
        # debugger
        # puts 'lo'

        @action = route.defaults[:action].to_sym
        @verb = find_verb_from(route.verb)
        @params = find_params_from(route.parts)

        @url = find_url
        hsh[@action] = make_executable if options_require @action
      end
    end

    private

    def make_executable
      "request_via_redirect(:#{@verb}, '#{@url}', #{@params})"
    end

    def options_require(action)
      if @options[:only]
        @options[:only].include? action
      elsif @options[:except]
        @options[:except].exclude? action
      else
        true
      end
    end

    def find_verb_from(regex)
      actions = %w(GET POST PUT DELETE)
      actions.select { |a| a.match(regex) }.first.downcase
    end

    def find_params_from(matcher_list)
      matcher_list.reject! { |elem| elem == :format }
      raise "can only handle [:id], but got #{matcher_list}" unless matcher_list.length <= 1
      params = {}
      params = {:id => @instance.to_param} if matcher_list.include?(:id)
      params.merge! @access_attrs if upgrade_params?
      params
      puts 'hi'
      debugger
      puts 'lo'

    end

    def find_url
      url_for only_path: true, controller: @controller_name, action: @action, id: @instance.to_param
    end

    def upgrade_params?
      @action == :create || @action == :update
    end
  end

end