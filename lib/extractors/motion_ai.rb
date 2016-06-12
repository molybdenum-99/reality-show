module Extractors
  class MotionAI
    def self.perform(params, _request)
      [params['reply'], params.merge(format: 'motion_ai')]
    end
  end
end
