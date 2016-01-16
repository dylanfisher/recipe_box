class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  before_action :set_body_class

  helper_method :current_or_guest_user

  # if user is logged in, return current_user, else return guest_user
  def current_or_guest_user
    if current_user
      current_user
    else
      guest_user
    end
  end

  def guest_user
    @cached_guest_user ||= User.guest
  end

  private

    def set_body_class
      parts = []
      parts << "controller--#{controller_path.gsub('/', '-')}" if try(:controller_path)
      parts << "action--#{action_name}" if try(:action_name)
      parts << "container-fluid"
      parts << "application-body"
      @application_body_class = parts.join(" ")
    end

end
