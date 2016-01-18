module MetaHelper
  DEFAULT_DESCRIPTION = 'Create an account and become part of Recipe Box today.'
  DEFAULT_KEYWORDS    = 'Recipe Box, New York, NYC, Design, Food, Vegetarian, Vegan, Healthy'

  def page_title(path=[])
    title = (Array(path) << 'Recipe Box').uniq.join(' | ')
    content_for(:page_title, title.to_s)
  end

  def page_description(description)
    content_for(:page_description, "#{description.to_s} #{DEFAULT_DESCRIPTION}")
  end

  def page_keywords(keywords)
    # words = (Array(keywords) << 'Recipe Box').uniq.join(' | ')
    # content_for(:page_keywords, words.to_s)
  end
end
