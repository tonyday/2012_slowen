module ApplicationHelper

  def display_flash
    flash.each do |key, value|
      content_tag(:div, value, class: "flash #{key}")
    end
  end

end
