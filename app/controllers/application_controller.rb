include SessionsHelper
include EnrollmentsHelper
# include DoSearchHelper
class ApplicationController < ActionController::Base
end

private
  def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
  end


