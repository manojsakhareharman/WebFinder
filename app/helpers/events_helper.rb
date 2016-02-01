module EventsHelper

  def event_date(event)
    last_part = ""
    if event.end_on > event.start_on
      last_part = " - " + I18n.l(event.end_on, format: :long)
    end
    I18n.l(event.start_on, format: :long) + last_part
  end

  def link_to_event(link_content, event, opts={})
    if event.more_info_link.present?
      if event.featured? && event.page_content.present?
        link_to(link_content, event, opts)
      else
        link_to(link_content, event.more_info_link, opts.merge(target: event.new_window? ? "_blank" : ""))
      end
    elsif event.featured?
      link_to(link_content, event, opts)
    end
  end

end
