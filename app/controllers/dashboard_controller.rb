class DashboardController < Admin::ApplicationController

  def index
    @records = admin_routes
  end

  protected

  def admin_routes
    Rails.application.routes.routes.select do |route|
      route.defaults[:controller] =~ /^admin\/(.+)/ &&
        route.defaults[:action] == 'index' &&
        route.name == "admin_#{$1}"
    end
  end

end
