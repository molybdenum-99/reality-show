require './boot'

use Rack::Timeout
Rack::Timeout.service_timeout = 30
Rack::Timeout.wait_timeout = 30

get '/' do
  erb :index
end

post '/query' do
  query, options = if params['auth_token']
    Extractors::Hipchat.perform(params, request)
  elsif params['reply']
    Extractors::MotionAI.perform(params, request)
  else
    Extractors::Web.perform(params, request)
  end

  QueryJob.perform_async(query, options)

  { "message" => "Searching..." }.to_json
end
