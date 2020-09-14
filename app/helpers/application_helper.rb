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

      content_tag(:div, class: 'd-flex flex-column mt-1') do
        link_to new_event_path, class: 'd-flex flex-column align-items-center button is-info ml-3 mr-3' do
          content_tag(:i, class: 'fa fa-plus events pt-1') do
          end +
          content_tag(:small, class: 'pt-1') do
            'New Event'
          end
        end
      end +

      content_tag(:div, class: 'd-flex flex-column mt-1') do
        link_to events_path, class: 'd-flex flex-column align-items-center button is-info ml-3 mr-3' do
          content_tag(:i, class: 'fa fa-calendar events pt-1') do
          end +
          content_tag(:small, class: 'pt-1') do
            'Events'
          end
        end
      end +

      content_tag(:div, class: 'd-flex flex-column mt-1') do
        link_to current_user, class: 'd-flex flex-column align-items-center button is-info ml-3 mr-3' do
          content_tag(:i, class: 'fa fa-user-circle-o events pt-1') do
          end +
          content_tag(:small, class: 'pt-1') do
            current_user.name
          end
        end
      end +

      content_tag(:div, class: 'd-flex flex-column mt-1') do
        link_to logout_path, class: 'd-flex flex-column align-items-center button is-info ml-3 mr-3' do
          content_tag(:i, class: 'orange fa fa-sign-out events pt-1') do
          end +
          content_tag(:p, class: 'orange pt-1') do
            'Logout'
          end
        end
      end

    else
      content_tag(:div, class: 'd-flex flex-column mt-1') do
        link_to new_user_path, class: 'd-flex flex-column align-items-center button is-info ml-3 mr-3' do
          content_tag(:i, class: 'fa fa-user-circle-o events pt-1') do
          end +
          content_tag(:small, class: 'pt-1') do
            'New User'
          end
        end
      end +

      content_tag(:div, class: 'd-flex flex-column mt-1') do
        link_to login_path, class: 'd-flex flex-column align-items-center button is-info ml-3 mr-3' do
          content_tag(:i, class: 'orange fa fa-sign-in events pt-1') do
          end +
          content_tag(:p, class: 'orange pt-1') do
            'Login'
          end
        end
      end

    end
  
  end

  # def login_helper
  #   if current_user?
  #     content_tag(:p) do
  #       link_to current_user.name, current_user, class: 'bars'
  #     end +
  #       content_tag(:p) do
  #         link_to 'New Event', new_event_path, class: 'bars'
  #       end +
  #       content_tag(:p) do
  #         link_to 'All Events', events_path, class: 'bars'
  #       end +
  #       content_tag(:p) do
  #         link_to 'Logout', logout_path, class: 'bars'
  #       end
  #   else
  #     content_tag(:p) do
  #       link_to 'New User', new_user_path, class: 'bars'
  #     end +
  #       content_tag(:p) do
  #         link_to 'Login', login_path, class: 'bars'
  #       end
  #   end
  # end

end
