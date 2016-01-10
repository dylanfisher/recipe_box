module DashboardHelper

  def admin_record_name(record)
    record.name.gsub(/^admin_?/, '').titleize
  end

  def admin_area?
    controller.class.name =~ /\AAdmin/
  end

end
