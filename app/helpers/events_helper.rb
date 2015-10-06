module EventsHelper

  def event_date(event)
    last_part = ""
    if event.end_on > event.start_on
      last_part = " - " + I18n.l(event.end_on, format: :long)
    end
    I18n.l(event.start_on, format: :long) + last_part
  end

end
