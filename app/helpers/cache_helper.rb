module CacheHelper
  # def cache_key_for(model)
  #   count          = model.count
  #   max_updated_at = model.maximum(:updated_at).try(:utc).try(:to_s, :number)
  #   "#{model.model_name.plural}/all-#{count}-#{max_updated_at}"
  # end

  def cache_key_for(collection)
    count = collection.count
    if collection.is_a?(Array)
      return if collection.blank?
      max_updated_at = collection.reject(&:blank?).max_by(&:updated_at).updated_at.try(:utc).try(:to_s, :number)
      "#{collection.first.model_name.plural}/all-#{count}-#{max_updated_at}"
    else
      max_updated_at = collection.maximum(:updated_at).try(:utc).try(:to_s, :number)
      "#{collection.model_name.plural}/all-#{count}-#{max_updated_at}"
    end
  end

  def cache_digest_for(stringable)
    Digest::MD5.hexdigest(stringable.to_s)
  end
end
