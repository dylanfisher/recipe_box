class BlogController < ApplicationController

  def mmmbox
    @images = Tumblr::Page.new(Rails.application.secrets.tumblr_handle, 1).images
  end

end
