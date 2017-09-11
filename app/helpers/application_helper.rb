require 'pry'
module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    if page_title.empty?
      APP_NAME
    else
      APP_NAME + " | " + page_title
    end
  end

end
