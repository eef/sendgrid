module SendgridWeb
  class Exception
    class AuthenticationFailure < StandardError; end
    class NoAPIKey < StandardError; end
    class NoAPIUser < StandardError; end
    class APIError < StandardError; end
  end
end
