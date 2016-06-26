module NavigationHelper

  def request_path_base
    @request_path_base ||= request.path.split('/').reject(&:blank?).first
  end

  def nav_class(path)
    classes = []
    classes << 'link--blank-hover'
    classes << 'nav-item--active' if request_path_base == path.split('/').reject(&:blank?).first
    classes.join(' ')
  end

end
