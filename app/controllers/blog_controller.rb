class BlogController < ApplicationController

  def mmmbox
    @page   = params.fetch(:page, 1).to_i
    @images = Tumblr::Page.new(Rails.application.secrets.tumblr_handle, @page).images

    respond_to do |format|
      format.html
      format.js
    end
  end

end
