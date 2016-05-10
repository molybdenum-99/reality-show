require 'sinatra'
require 'reality'

include Reality::Methods
Reality.configure(:demo)
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE # If you have problems with local SSL certificate

get '/' do
  erb :index
end

get '/query' do
  @result = begin
    { result: (eval(params['query']) || 'blank').to_s }
  rescue =>e
    { result: e.message, error: e.message }
  end
  @result.to_json
end
