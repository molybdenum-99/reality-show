require './boot'

class QueryJob
  @queue = :default

  def self.perform(query, options)
    data = Searcher.new.get(query)
    Responder.respond(data, options)
  end
end
