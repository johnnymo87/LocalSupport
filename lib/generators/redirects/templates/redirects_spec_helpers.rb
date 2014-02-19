require 'action_dispatch/testing/integration'

module RequestSpecHelpers
  def all_routes
    routes = Rails.application.routes.routes
    require 'rails/application/route_inspector'
    inspector = Rails::Application::RouteInspector.new
    routes = inspector.collect_routes(routes)
    routes.each do |route|
      route.delete :name
      route[:verb] = route[:verb].present? ? route[:verb].downcase : 'get'
      route[:path] = route[:path].gsub(/\(.*\)/, '')
      route.delete :reqs
    end
  end
end

module ActionDispatch
  module Integration
    module RequestHelpers

      CALLED_ROUTES = []

      def request_via_redirect(http_method, path, parameters = nil, headers = nil)
        process(http_method, path, parameters, headers)
        record_route(http_method, path)
        redirect_count = 0
        while redirect? do
          follow_redirect!
          redirect_count += 1
          raise 'Redirected more than 5 times, check for infinite redirects.' if redirect_count > 5
        end
        raise "Expected status 200, got status #{status}" unless status == 200
      end

      def record_route(http_method, path)
        CALLED_ROUTES << http_method.to_s + ' ' + path
      end

      def all_routes
        routes = Rails.application.routes.routes
        require 'rails/application/route_inspector'
        inspector = Rails::Application::RouteInspector.new
        routes = inspector.collect_routes(routes)
        routes.each do |route|
          route.delete :name
          route[:verb] = route[:verb].present? ? route[:verb].downcase : 'get'
          route[:path] = route[:path].gsub(/\(.*\)/, '')
          route.delete :reqs
        end
      end

      def unchecked_routes
        all_routes.map! { |route| route[:verb] + ' ' + route[:path] }.reject { |route| CALLED_ROUTES.include? route }
      end

    end
  end
end
