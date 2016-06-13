require './boot'

use Rack::Timeout
Rack::Timeout.service_timeout = 30
Rack::Timeout.wait_timeout = 30

get '/' do
  erb :index
end

get '/query' do
  Searcher.new.get(params['query']).to_json
end

post '/bot-query' do
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
