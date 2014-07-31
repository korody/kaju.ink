module IconsHelper
  def icon_tag(icon, options = {})
    options[:class] = (%w[fa] | icon.split).join(" fa-")
    content_tag :i, nil, options
  end

  def icon_to(icon, link, options = {})
    link_to icon_tag(icon), link, options
  end
end