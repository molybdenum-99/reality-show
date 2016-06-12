class Searcher
  include Reality::Methods
  include Reality::IRuby

  def get(query)
    query(query)
  end

  private

  def query(query)
    @result = begin
      result = eval(query) || 'blank'
      { result: result.respond_to?(:to_html) ? result.to_html : result.to_s }
    rescue =>e
      { result: e.message, error: e.message }
    end
    @result
  end
end
