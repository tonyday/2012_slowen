module ApplicationHelper

  def display_flash
    flash.inject('') do |result, arr|
      result += content_tag(:div, arr[1], class: "alert alert-#{arr[0]}")
    end.html_safe
  end

  def full_title(page_title)
    base_title = "Slowen"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

end
