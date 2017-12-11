class HomeController < ApplicationController
  def index
    if current_user.vk_access_token.present?
      @groups = Vk.new(current_user.vk_access_token).get_infos(:groups, {filter: 'editor', extended: 1})
      # @walls = []
      # @groups[:items].each do |group|
      #   @walls << Vk.new(current_user.vk_access_token).get_infos(:wall, {owner_id: -group['id'], extended: 0, filter: 'postponed'})
      # end
    end
  end
end
