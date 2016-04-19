require 'sinatra'
require 'reality'

Reality.configure(:demo)

get '/' do
  erb :index
end

get '/query' do
  @result = eval(params['query'])
  erb :index
end
