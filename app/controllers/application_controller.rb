class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  before_action :set_body_class

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
