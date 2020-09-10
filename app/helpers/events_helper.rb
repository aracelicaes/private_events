module EventsHelper
  def prueba(event)
      event.attendances.build(user_id: current_user.id)
      event.save
  end
end
