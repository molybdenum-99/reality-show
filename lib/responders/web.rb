require "zlib"
require "base64"

module Responders
  class Web
    def self.perform(data, options)
      compressed = Base64.encode64(Zlib::Deflate.deflate(data.to_json))
      Pusher.trigger(options['channel'], 'response', compressed)
    end
  end
end
