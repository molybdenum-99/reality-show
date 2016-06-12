require 'sinatra'
require 'reality'
require 'reality/iruby'
require 'rack-timeout'
require 'sidekiq'
require 'faraday'
require 'require_all'
require_all 'lib'
require_all 'jobs'

use Rack::Timeout
Rack::Timeout.service_timeout = 30
Rack::Timeout.wait_timeout = 30

Reality.configure(:demo)
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE # If you have problems with local SSL certificate
