require 'json'
require 'net/http'
require 'uri'
require 'ostruct'
require 'sendgrid_web/client'
require 'sendgrid_web/exception'

module SendgridWeb

  BASE_URI = "api.sendgrid.com/api"

  class << self
    def api_user=(v); @api_user = v; end
    def api_user; @api_user; end
    def api_key=(v); @api_key = v; end
    def api_key; @api_key; end
  end

end
