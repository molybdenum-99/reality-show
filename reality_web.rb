require 'sinatra'
require 'reality'

Reality.configure(:demo)

get '/' do
  erb :index
end

get '/query' do
  @result = begin
    { result: eval(params['query']).to_s }
  rescue =>e
    { result: e.message, error: e.message }
  end
  @result.to_json
end
