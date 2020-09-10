module ApplicationHelper
  def display_propper_flash
    if flash[:alert]
      content_tag(:div, flash[:alert], id: 'notice_alert', align: 'center')
    elsif flash[:notice]
      content_tag(:div, flash[:notice], id: 'notice', align: 'center')
    elsif flash[:danger]
      content_tag(:div, flash[:danger], id: 'notice_alert', align: 'center')
    end
  end
end
