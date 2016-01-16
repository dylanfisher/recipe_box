module MarkdownHelper
  def md(content)
    markdown_parser.render(content.to_s).html_safe
  end

  private
    def markdown_parser
      @markdown_parser ||= RecipeBox::Markdown.new
    end
end
