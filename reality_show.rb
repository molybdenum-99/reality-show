require 'sinatra'
require 'reality'
require 'reality/iruby'

include Reality::Methods
include Reality::IRuby
Reality.configure(:demo)
# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE # If you have problems with local SSL certificate

get '/' do
  erb :index
end

get '/query' do
  query(params['query'])
end

post '/bot-query' do
  puts params
  query(params['reply'])
end


def query(query)
  @result = begin
    result = eval(query) || 'blank'
    { result: result.respond_to?(:to_html) ? result.to_html : result.to_s }
  rescue =>e
    { result: e.message, error: e.message }
  end
  @result.to_json
end

module Reality
  module IRuby
    module Extensions
      def html_reality_style
        'border: 1px solid #B0C6D0; padding: 1px; cursor: pointer;'
      end
    end
  end
end
