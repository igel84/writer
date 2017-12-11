class HomeController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'open-uri'
  require 'httparty'

  def index
    if current_user.token.present?
      url = "https://api.vk.com/method/groups.get?filter=editor&access_token=#{current_user.token}&v=V"
      uri = URI::encode(url)
      response = HTTParty.get(uri)
      @result = response
      # response["response"].each do |group_id|
      #   @result += group_id
      # end
    end
    # render inline: "<h6>Ok!</h6>"
  end
end
