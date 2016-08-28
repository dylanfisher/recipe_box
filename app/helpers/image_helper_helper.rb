module ImageHelperHelper

  def responsive_image(object, options = {})
    column_size = options.delete(:column_size) || 6
    max_column_width = Column.sizes[column_size]
    max_column_width_retina = max_column_width * 2
    src_url = closest_url(object, column_size)
    vw_size = ( column_size / Column::COLUMN_COUNT.to_f ) * 100

    srcset_sizes = [
      "(max-width: 768px) 100vw",
      "#{max_column_width}px",
    ]

    srcset_urls = object.options[:styles].collect.with_index do |style, index|
      next if parse_size(style[1]) > max_column_width_retina
      retina_width = parse_size(style[1]) * 2
      retina_column_index = Column.closest_index(retina_width)
      closest_retina_width = parse_size(object.options[:styles][closest_size(object, retina_column_index)])
      "#{object.url(style[0])} #{parse_size(style[1])}w"
      "#{closest_url(object, retina_column_index)} #{closest_retina_width}w"
    end.reject(&:blank?).uniq

    image_tag( src_url, sizes: srcset_sizes.join(', '), srcset: srcset_urls.join(', ').presence, **options )
  end

  private

    # Returns the closest style of a Paperclip attachment for a given number
    def closest_size(object, size)
      sizes = object.options[:styles].values.collect{ |x| { x => parse_size(x) } }.sort_by{ |x| x.values }
      closest_size_hash = sizes.min_by { |x| ( x.values.first.to_f - Column.sizes[size] ).abs }
      style = object.options[:styles].key(closest_size_hash.keys.first)
    end

    def closest_url(object, size)
      object.url closest_size(object, size)
    end

    def parse_size(size)
      size[/^\d*/].to_i
    end

end
