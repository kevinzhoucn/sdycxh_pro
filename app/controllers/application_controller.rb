class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_menu

  def get_menu
    @categories = Category.all
  end
end
