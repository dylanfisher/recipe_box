class RecipeBoxParser < Redcarpet::Render::HTML
  include Redcarpet::Render::SmartyPants

  cattr_accessor :default_options
  @@default_options = {
    autolink: true
  }

  attr_reader :renderer, :options

  def initialize(options = @@default_options)
    @options = options
    @renderer = Redcarpet::Markdown.new self,options
  end

  def render(text)
    renderer.render(text || '')
  end
end
