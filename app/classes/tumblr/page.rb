require 'open-uri'
require 'nokogiri'

class Tumblr::Page

  def self.url_base
    "http://#{Rails.application.secrets.tumblr_handle}.tumblr.com"
  end

  def initialize(handle, page)
    @handle = handle
    @page   = page
  end

  def images
    # TODO: Make sure the cache bust in recipebox.rake is working
    Rails.cache.fetch(url) do
      doc.css('.photo-wrapper img').to_html.html_safe
    end
  end

  protected

    def url
      "#{Tumblr::Page.url_base}/page/#{@page}"
    end

    def request
      open(url)
    end

    def doc
      Nokogiri::HTML(request)
    end

end
