require 'sinatra'
require 'reality'

Reality.configure(:demo)

get '/' do
  Reality::Entity.new('Ukraine').area.to_s
end
