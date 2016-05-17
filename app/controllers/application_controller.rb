class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery with: :exception

  before_action :redirect_to_holding_page
  before_action :set_body_class
  before_action :initialize_style_variables
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_or_guest_user

  def redirect_to_holding_page
    if Rails.env.production?
      redirect_to holding_page_path unless controller_name == 'holding_pages'
    end
  end

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

  def guest_user?
    current_user == guest_user
  end

  def after_sign_in_path_for(resource_or_scope)
    user_path current_user
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :location]
      devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name, :location]
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

    def user_not_authorized(exception)
      policy_name = exception.policy.class.to_s.underscore

      flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
      redirect_to(request.referrer || root_path)
    end

    def initialize_style_variables
      @application_body_styles ||= {}
    end
end
