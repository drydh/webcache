class WebCache
  class Response
    attr_accessor :error, :base_uri, :content, :body

    def initialize(opts={})
      if opts.respond_to?(:read) && opts.respond_to?(:base_uri)
        self.base_uri = opts.base_uri
        self.content  = opts.read
        self.error    = nil
        self.body     = self.content
      elsif opts.is_a? Hash
        self.base_uri = opts[:base_uri] if opts[:base_uri]
        self.content  = opts[:content]  if opts[:content]
        self.error    = opts[:error]    if opts[:error]
        self.body     = opts[:body]     if opts[:body]
      end
    end

    def to_s
      content
    end
  end
end
