require './boot'

use Airbrake::Rack::Middleware
use Rack::Timeout
Rack::Timeout.service_timeout = 5
Rack::Timeout.wait_timeout = 5

get '/' do
  erb :index
end

post '/search' do
  query, options = if params['auth_token']
    Extractors::Hipchat.perform(params, request)
  elsif params['reply']
    Extractors::MotionAI.perform(params, request)
  else
    Extractors::Web.perform(params, request)
  end

  if params['sync']
    Searcher.new.get(query).to_json
  else
    Resque.enqueue(QueryJob, query, options)
    { "message" => "Searching..." }.to_json
  end
end
