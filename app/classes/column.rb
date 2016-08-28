# Column: a class to represent CSS columns in Ruby

class Column

  COLUMN_COUNT = 12
  GUTTER_SIZE = 15
  MAX_WIDTH = 1170

  # Returns the pixel size of a single column
  def self.size
    ( ( ( 100.0 / COLUMN_COUNT ) / 100.0 ) * MAX_WIDTH ).round(1)
  end

  # Returns a hash of each column and it's max pixel size
  def self.sizes
    @sizes ||= COLUMN_COUNT.times.collect do |i|
      { (i + 1) => size * (i + 1) }
    end.reduce(&:merge)
  end

  # Returns a hash of the closest column and its associated pixel size
  def self.closest_hash(size)
    closest_size = sizes.values.min_by { |x| (x.to_f - size).abs }
    { Column.sizes.key(closest_size) => sizes[ Column.sizes.key(closest_size) ] }
  end

  # Returns the closest column index for a given number
  def self.closest_index(size)
    closest_hash(size).keys.first
  end

  # Returns the closest column pixel size to a given number
  def self.closest_value(size)
    closest_hash(size).values.first
  end

end
