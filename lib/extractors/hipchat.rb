module Extractors
  class Hipchat
    def self.perform(params, request)
      body_params = JSON.parse(request.body.read)
      command = body_params['item']['message']['message'].split(' ', 2)[1]
      [command, params.merge(body_params).merge(format: 'hipchat')]
    end
  end
end
