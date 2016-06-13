require 'sinatra'
require 'reality'
require 'reality/iruby'
require 'rack-timeout'
require 'sidekiq'
require 'faraday'
require 'pusher'
require 'require_all'
require_all 'lib'
require_all 'jobs'


Pusher.app_id = '215677'
Pusher.key = "7b59d48fb0c2aff9dfb7"
Pusher.secret = "bd5f2588ff9b7f93f2e5"

Reality.configure(:demo)
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE # If you have problems with local SSL certificate

#patching
module Reality
  module IRuby
    module Extensions
      def html_reality_style
        'border: 1px solid #B0C6D0; padding: 1px; cursor: pointer;'
      end
    end
  end
end
