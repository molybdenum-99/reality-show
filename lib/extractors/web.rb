module Extractors
  class Web
    def self.perform(_params, request)
      body_params = JSON.parse(request.body.read)
      [body_params['query'], body_params.merge(format: 'web')]
    end
  end
end
