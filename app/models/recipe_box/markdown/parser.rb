module RecipeBox
  class Markdown
    class Parser < Redcarpet::Render::HTML
      include Redcarpet::Render::SmartyPants
    end
  end
end
