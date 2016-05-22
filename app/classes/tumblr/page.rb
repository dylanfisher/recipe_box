require 'open-uri'
require 'nokogiri'

class Tumblr::Page

  def initialize(handle, page)
    @handle = handle
    @page   = page
  end

  def images
    Rails.cache.fetch(url, expires_in: 12.hours) do
      doc.css('.photo-wrapper img').to_html.html_safe
    end
  end

  protected

    def url
      "http://#{@handle}.tumblr.com/page/#{@page}"
    end

    def request
      open(url)
    end

    def doc
      Nokogiri::HTML(request)
    end

end
