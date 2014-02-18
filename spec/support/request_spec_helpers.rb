# http://www.emmanueloga.com/2012/04/21/Tidying-up-an-rspec-suite-with-some-helpers.html

module RequestSpecHelpers
  def all_routes
    routes = Rails.application.routes.routes
    require 'rails/application/route_inspector'
    inspector = Rails::Application::RouteInspector.new
    routes = inspector.collect_routes(routes)
    name = ''
    routes.each do |route|
      name = route[:name] if route[:name].present?
      route[:name] = route[:name].present? ? route[:name] + '_path' : name + '_path'
      route[:verb] = route[:verb].present? ? route[:verb].downcase : 'get'
      route.delete :path ; route.delete :reqs
    end
  end
end

require 'action_dispatch/testing/integration'
module ActionDispatch
  module Integration
    module RequestHelpers
      def request_via_redirect(http_method, path, parameters = nil, headers = nil)
        process(http_method, path, parameters, headers)
        redirect_count = 0
        while redirect? do
          follow_redirect!
          redirect_count += 1
          raise 'redirected more than 5 times, check for infinite redirects.' if redirect_count > 5
        end
        puts status
      end
    end
  end
end
