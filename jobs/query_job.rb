require './boot'

class QueryJob
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform(query, options)
    data = Searcher.new.get(query)
    Responder.respond(data, options)
  end
end
