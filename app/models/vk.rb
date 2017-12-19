class Vk
  require 'net/http'
  require 'uri'
  require 'open-uri'
  include HTTParty

  base_uri 'https://api.vk.com/method'

  def initialize(access_token)
    @postfix = "&access_token=#{access_token}&v=5.69"
  end

  def get_infos(which=:groups, options={})
    params = options.map{|k,v| "#{k}=#{v}"}.join('&')
    Rails.logger.info params
    begin
      response = self.class.get("/#{which}.get?#{params}"+@postfix)['response']
    rescue SocketError => e
      Rails.logger.info e.message
      response = {}
      response['count'] = 0
      response['items'] = []
    end
    {count: response['count'], items: response['items']}
  end

  # def get_groups(access_token)
  #   url = "https://api.vk.com/method/groups.get?filter=editor&extended=1&access_token=#{current_user.vk_access_token}&v=5.69"
  #   uri = URI::encode(url)
  #   response = HTTParty.get(uri)["response"]
  #   # @result = response
  #   @result = []
  #   response["items"].each do |group_id|
  #     @result << group_id
  #   end
  # end
end