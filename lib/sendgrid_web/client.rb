module SendgridWeb
  class Client

    def initialize(api_user = nil, api_key = nil)
      @api_user = api_user || SendgridWeb.api_user
      @api_key = api_key || SendgridWeb.api_key
      raise(Exception::NoAPIKey, "API Key must be present") if @api_key.blank? || @api_key.nil?
      raise(Exception::NoAPIUser, "API User must be present") if @api_user.blank? || @api_user.nil?
    end
    
    protected
      def post(module_name, action_name, opts = {})
        uri = URI.parse("https://#{BASE_URI}/#{module_name}.#{action_name}.json")
        uri.query = params(opts)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        request = Net::HTTP::Post.new(uri.request_uri)
        response = http.request(request)
        if response.code.eql?("200")
          response
        elsif response.code.eql?("403")
           raise(Exception::AuthenticationError, process_error(response.body))
        else
           raise(Exception::APIError, process_error(response.body))
        end
      end

      def params(opts)
        URI.encode_www_form({api_key: @api_key, api_user: @api_user}.merge(opts))
      end

    private
      def process_error(response_body)
        results = JSON.parse(response_body)
        if results.has_key?("error")
          results["error"]
        end
      end
  end
end
