module ApplicationHelper

  def cache_key_for(model)
    count          = model.count
    max_updated_at = model.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "#{model.model_name.plural}/all-#{count}-#{max_updated_at}"
  end

  def embedded_svg(filename, options={})
    file = File.read(Rails.root.join('app', 'assets', 'images', 'svg', "#{filename}.svg"))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] = options[:class]
    end
    doc.to_html.html_safe
  end

end
