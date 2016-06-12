module Responders
  class MotionAI
    def self.perform(data, options)
      data.to_json
    end
  end
end
