module RecipeBox
  class Markdown
    cattr_accessor :default_options
    @@default_options = {
      autolink: true
    }

    attr_reader :renderer, :options

    def initialize(options = @@default_options)
      @options = options
      @renderer = Redcarpet::Markdown.new RecipeBox::Markdown::Parser, options
    end

    def render(text)
      renderer.render(text || '')
    end
  end

end
