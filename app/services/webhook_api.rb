# frozen_string_literal: true

require 'uri'
require 'net/http'

module WebhookApi
  URL = URI('http://webhook.site/bcbdaabb-8ad4-48d9-a9f7-432bad725e9f')

  def send_request
    Net::HTTP.post_form(URL, 'q' => 'ruby', 'max' => '50')
  end

  def send_csv_request(file_path)
    Net::HTTP.post_form(URL, 'q' => "s3_url= #{file_path}", 'max' => '50')
  end
end
