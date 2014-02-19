require './lib/generators/redirects/templates/redirects_spec_helpers.rb'
include RequestSpecHelpers

class RedirectsGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)


  desc 'This generator added RSpec request specs to a Rails application to check for infinite redirect loops'

  def install
    @all_routes = all_routes
    template 'redirects_spec.tt', 'spec/requests/redirects_spec.rb'
    copy_file 'redirects_spec_helper.rb', 'spec/support/redirects_spec_herlpers.rb'
  end
end
