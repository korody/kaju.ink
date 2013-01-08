module PagesHelper
  def full_title(page_title)
    base_title = "kaju.ink"
    page_title.empty? ? base_title : "#{base_title} | #{page_title}"
  end
end
