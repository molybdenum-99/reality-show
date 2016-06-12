module Extractors
  class Web
    def self.perform(params, _request)
      [params['query'], params.merge(format: 'web')]
    end
  end
end
