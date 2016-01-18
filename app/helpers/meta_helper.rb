module MetaHelper
  def page_title(path=[])
    title = (Array(path) << 'Recipe Box').uniq.join(' | ')
    # binding.pry
    content_for(:page_title, title.to_s)
  end
end
