module ApplicationHelper

  BOOK_STATUSES = {
      all_books: 'all',
      available_books: 'available',
      unavailable_books: 'unavailable'
  }

  def menu_item_class(item)
    if params[:controller] == item
      return 'active'
    end

    if params[:controller] == 'books' && BOOK_STATUSES[item.to_sym] == params[:status] && BOOK_STATUSES[item.to_sym].present?
      'active'
    end
  end

  def bootstrap_class_for flash_type
    { success: "alert-success",
      alert: "alert-danger",
      notice: "alert-info"
    }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in text-center") do
        concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
        concat message
      end)
    end
    nil
  end

  def current_admin
    current_user
  end
end
