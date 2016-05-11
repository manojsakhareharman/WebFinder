module LandingPagesHelper

  # Pages created with a specific locale are HTML-only. Otherwise,
  # textilize the content before rendering. This may change in
  # the future--removing the textilize system.
  def render_content(landing_page, section_name)
    if landing_page.original_locale
      raw landing_page.send(section_name.to_sym)
    else
      raw textilize landing_page.send(section_name.to_sym)
    end
  end

end
