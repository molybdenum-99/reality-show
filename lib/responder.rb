class Responder
  def self.respond(data, options)
    case options['format']
    when 'hipchat'
      Responders::Hipchat.perform(data, options)
    when 'motion_ai'
      Responders::MotionAI.perform(data, options)
    when 'web'
      Responders::Web.perform(data, options)
    else
      raise("wrong format: #{options['format']}")
    end
  end
end
