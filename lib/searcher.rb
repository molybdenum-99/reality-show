class Searcher
  include Reality::Methods
  include Reality::IRuby

  def get(query)
    query(query)
  end

  private

  def query(query)
    @result = begin
      p query
      result = eval(query) || 'blank'
      { result: format_response(result) }
    rescue SyntaxError, StandardError => e
      { result: e.message, error: e.message }
    end
    @result
  end

  def format_response(result)
    if result.respond_to?(:to_html)
      result.to_html
    else
      if result.is_a?(Array)
        result.map {|e| e.respond_to?(:to_html) ? e.to_html : e.to_s }
      else
        result.to_s
      end
    end
  end
end
