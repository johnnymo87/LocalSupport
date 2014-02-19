class InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)


  desc 'This generator added RSpec request specs to a Rails application to check for infinite redirect loops'

  def install
    template 'redirects_spec.rb', 'spec/requests/redirects_spec.rb'
    copy_file 'redirects_spec_helper.rb', 'spec/support/redirects_spec_herlpers.rb'
  end
end
