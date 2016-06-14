require "zlib"
require "base64"

module Responders
  class Web
    def self.perform(data, _options)
      compressed = Base64.encode64(Zlib::Deflate.deflate(data.to_json))
      Pusher.trigger('query', 'response', compressed)
    end
  end
end
