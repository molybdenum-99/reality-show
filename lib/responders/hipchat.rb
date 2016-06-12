module Responders
  class Hipchat
    def self.perform(data, options)
      response = { "color" => "green",
                    "message" => data[:result],
                    "notify" => true,
                    "message_format" => "html"
                  }.to_json
      url = "https://hipchat.com/v2/room/#{options['item']['room']['id']}/notification?auth_token=#{options['auth_token']}"
      Faraday.post url, response, 'Content-Type' => 'application/json'
    end
  end
end
