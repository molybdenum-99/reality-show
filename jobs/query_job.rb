require './boot'

class QueryJob
  include Sidekiq::Worker

  def perform(query, options)
    data = Searcher.new.get(query)
    Responder.respond(data, options)
  end
end
