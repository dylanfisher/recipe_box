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

  def flash_message
    flash_message_close = %{<span class="flash-message__close">×</span>}
    flash_message_check = %{<span class="flash-message__close">✔</span>}

    if flash[:notice]
      %{<div class="flash-message flash-message--notice">#{flash_message_close} #{flash[:notice]}</div>}
    elsif flash[:error]
      %{<div class="flash-message flash-message--error">#{flash_message_close} #{flash[:error]}</div>}
    elsif flash[:success]
      %{<div class="flash-message flash-message--success">#{flash_message_check} #{flash[:success]}</div>}
    end
  end

  def user_or_login_path
    if current_user
      user_path current_user
    else
      new_user_session_path
    end
  end

  def users_own_profile?(user)
    current_user && current_user == user
  end

  def application_body_styles
    return if @application_body_styles.blank?
    @application_body_styles.collect{|key, value| "#{key}: #{value};"}.join
  end

end
