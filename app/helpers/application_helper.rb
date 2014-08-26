module ApplicationHelper
  def full_title(page_title)
    base_title = "kaju.ink"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def active?(controller, action)
    "active" if controller?(controller) && action?(action)
  end

  def active_link_to(title, path, options = {})
    defaults = { type: nil, root: false }
    options = defaults.merge(options)
    if options[:root] and not params[:type]
      class_name = 'active'
    elsif params[:type] == options[:type].to_s
      class_name = 'active'
    end
    content_tag :li do
      link_to title, path, class: class_name, remote: :true
    end
  end

  def aerogami_tag
    content_tag :p, class: 'aerogami text-muted text-center' do
      "kaju.ink air craft by #{link_to "AEROGAMI", "http://www.aerogami.com.br", target: '_blank', title: ''}".html_safe
    end
  end

  def link_to_back(title, path)
    content_tag :div, class: 'back-link' do
      link_to "<-- #{title}", path, class: 'back-link'
    end
  end

  private

  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end

  def root
    request.fullpath == root_path
  end

  def about
    action_name == 'about'
  end

  def hello
    action_name == 'new'
  end

end