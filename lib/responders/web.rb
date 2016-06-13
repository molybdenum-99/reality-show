# require "zlib"

module Responders
  class Web
    def self.perform(data, _options)
      # compressed = Zlib::Deflate.deflate(data.to_json)
      Pusher.trigger('query', 'response', data.to_json)
    end
  end
end
