module SendgridWeb
  module Common

    def get(opts = {})
      response = post(module_name, 'get', opts)
      JSON.parse(response.body).collect { |r| OpenStruct.new(r) }
    end

    def delete(opts = {})
      response = post(module_name, 'delete', opts)
      error_check = JSON.parse(response.body)
      if !(error_check["message"]).nil?
        raise("Email address (#{opts[:email]}) does not exist") if error_check['message'].include?('does not exist')
      end
      response
    end

    def count
      # TODO: Count dem
    end

    def module_name
      self.class.to_s.split("::").last.downcase
    end

  end
end
