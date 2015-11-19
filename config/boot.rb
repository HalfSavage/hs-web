ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

require 'rails/commands/server'

module Rails
  # Override default development
  # Server port
  class Server
    def default_options
      # Doing OmniAuth stuff is a lot easier if you can map
      # halfsavage.com to localhost on port 80
      # TODO: It would be nice to find a better way to do this,
      # for HalfSavage devs who have something else running on
      # port 80 locally
      super.merge(Port: 31337)
    end
  end
end