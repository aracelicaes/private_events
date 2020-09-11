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

  def login_helper
    if current_user?
      content_tag(:p) do
        link_to current_user.name, current_user, class: 'bars'
      end +
        content_tag(:p) do
          link_to 'New Event', new_event_path, class: 'bars'
        end +
        content_tag(:p) do
          link_to 'All Events', events_path, class: 'bars'
        end +
        content_tag(:p) do
          link_to 'Logout', logout_path, class: 'bars'
        end
    else
      content_tag(:p) do
        link_to 'New User', new_user_path, class: 'bars'
      end +
        content_tag(:p) do
          link_to 'Login', login_path, class: 'bars'
        end
    end
  end
end
