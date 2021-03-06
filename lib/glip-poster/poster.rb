require 'faraday'
require 'faraday_middleware'

module Glip
  class Poster
    VERSION = '0.1.0'
    GLIP_WEBHOOK_BASE_URL = 'https://hooks.glip.com/webhook/'

    attr_reader :webhook_url
    attr_accessor :options
    attr_accessor :http

    def initialize(webhook_url_or_id)
      set_webhook_url(webhook_url_or_id)

      @options = {}

      @http = Faraday.new(url: GLIP_WEBHOOK_BASE_URL) do |faraday|
        faraday.request :json
        faraday.response :logger
        faraday.adapter Faraday.default_adapter # use Net::HTTP
      end
    end

    def set_webhook_url(webhook_url_or_id)
      if webhook_url_or_id.to_s !~ %r{/}
        @webhook_url = GLIP_WEBHOOK_BASE_URL + webhook_url_or_id
      elsif webhook_url_or_id =~ %r{^https?://}
        @webhook_url = webhook_url_or_id
      else
        fail ArgumentError, 'must include webhook URL or id argument'
      end
    end

    def send_message(message, opts = {})
      response = @http.post do |req|
        req.url @webhook_url
        req.body = @options.merge(opts).merge(body: message)
      end

      response
    end
  end
end
