require 'naught'

NullUser = Naught.build do |config|
  config.impersonate User
  config.predicates_return false
end
