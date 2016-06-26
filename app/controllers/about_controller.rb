class AboutController < ApplicationController
  def index
    skip_authorization
  end

  def statement
    skip_authorization
  end
end
