class ApplicationController < ActionController::Base
  include pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!
end
