module Responders
  class Hipchat
    def self.perform(data, options)
      html = data[:result].size < 10000 ? data[:result] : 'Sorry, too big for HipChat (> 10000 symbols)'

      response = { "color" => "green",
                    "message" => html,
                    "notify" => true,
                    "message_format" => "html"
                  }.to_json
      url = "https://hipchat.com/v2/room/#{options['item']['room']['id']}/notification?auth_token=#{options['auth_token']}"
      Faraday.post url, response, 'Content-Type' => 'application/json'
    end
  end
end
