require './boot'

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


#patching
module Reality
  module IRuby
    module Extensions
      def html_reality_style
        'border: 1px solid #B0C6D0; padding: 1px; cursor: pointer;'
      end
    end
  end
end
