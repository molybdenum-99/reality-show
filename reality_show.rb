require 'sinatra'
require 'reality'

Reality.configure(:demo)
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

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
