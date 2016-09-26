require './boot'
require 'timeout'
require 'time'

Resque::Failure.backend = Resque::Failure::Airbrake

class QueryJob
  @queue = :default

  def self.perform(query, options, queued_at)
    data = ''
    if Time.now > Time.parse(queued_at) + 100
      p "Expired job: #{query}, options: #{options}"
      data = { result: 'Expired: Sorry, seems like we have a long queue. Try again later.' }
    else
      begin
        Timeout::timeout(30) do
          data = Searcher.new.get(query)
        end
      rescue Timeout::Error => e
        p "Timeout for job: #{query}, options: #{options}"
        data = { result: 'Timeout: sorry, execution time should not be > 30 sec. Try to split your query.'}
      end
    end
    Responder.respond(data, options)
  end
end
