class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def test
    render inline: "<h6>Ok!</h6>"
  end
end
