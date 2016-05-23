module ApplicationHelper

  def cache_key_for(model)
    count          = model.count
    max_updated_at = model.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "#{model.model_name.plural}/all-#{count}-#{max_updated_at}"
  end

  def embedded_svg(filename, options={})
    options = options.merge(filename) if filename.is_a?(Hash)
    if options[:full_path]
      file = File.read(Rails.root.join(options[:full_path]))
    else
      file = File.read(Rails.root.join('app', 'assets', 'images', 'svg', "#{filename}.svg"))
    end
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] = options[:class]
    end
    doc.to_html.html_safe
  end

  def flash_message_type
    if flash_or_params(:notice)
      type = :notice
    elsif flash_or_params(:error)
      type = :error
    elsif flash_or_params(:success)
      type = :success
    else
      type = :other
    end
  end

  def flash_message
    if flash_message_type == :notice
      %{<div class="flash-message flash-message--notice">#{flash_or_params(:notice)}</div>}
    elsif flash_message_type == :error
      %{<div class="flash-message flash-message--error">#{flash_or_params(:error)}</div>}
    elsif flash_message_type == :success
      %{<div class="flash-message flash-message--success">#{flash_or_params(:success)}</div>}
    end
  end

  def user_or_login_path
    if current_user
      user_path current_user
    else
      new_user_session_path
    end
  end

  def users_own_profile?
    current_user && current_user == @user
  end

  def application_body_styles
    return if @application_body_styles.blank?
    @application_body_styles.collect{|key, value| "#{key}: #{value};"}.join
  end

  private

    def flash_or_params(name)
      flash[name] || params[name]
    end

end
