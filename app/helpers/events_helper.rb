module EventsHelper
  def displaylist(list)
    var = content_tag(:div) do
    end

    list.each do |event|
      var +=
        content_tag(:div, class: 'w-100 col-3') do
          content_tag(:div) do
            link_to image_tag('event.jpeg', alt: 'Logo', class: 'w-100'), event
          end +
            content_tag(:p, class: 'orange event_title') do
              "#{event.date}"
            end +
            content_tag(:p, class: 'event_title') do
              "#{event.title}"
            end
        end
    end

    var
  end
end
