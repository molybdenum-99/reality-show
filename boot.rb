require 'sinatra'
require 'reality'
require 'reality/shortcuts'
require 'reality/iruby'
require 'rack-timeout'
require 'sidekiq'
require 'faraday'
require 'pusher'
require 'dotenv'
require 'require_all'
require_all 'lib'
require_all 'jobs'

Dotenv.load

Pusher.app_id = ENV['PUSHER_APP_ID'] if ENV['PUSHER_APP_ID']
Pusher.key = ENV['PUSHER_KEY'] if ENV['PUSHER_KEY']
Pusher.secret = ENV['PUSHER_SECRET'] if ENV['PUSHER_SECRET']

Reality.configure(:demo)

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
