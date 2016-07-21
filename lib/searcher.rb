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
      result = eval(query)
      { result: format_response(result) }
    rescue SyntaxError, StandardError => e
      { result: e.message, error: e.message }
    end
    @result
  end

  def format_response(result)
    if result.is_a?(Array)
      result.map { |e| format_item(e) }
    else
      format_item(result)
    end
  end

  def format_item(item)
    if item.respond_to?(:to_html)
      item.to_html
    else
      item.nil? ? 'blank' : item.to_s
    end
  end
end
