module Responders
  class Web
    def self.perform(data, _options)
      Pusher.trigger('query', 'response', data)
    end
  end
end
