module UsersHelper
  def displaylist_user(list)
    var = content_tag(:div) do
    end

    list.each do |user|
      var +=
        content_tag(:div, class: 'w-100 col-2') do
          content_tag(:div) do
            link_to image_tag('woman.jpg', alt: 'Logo', class: 'w-100'), user
          end +
            content_tag(:p) do
              user.username.to_s
            end
        end
    end

    var
  end
end
