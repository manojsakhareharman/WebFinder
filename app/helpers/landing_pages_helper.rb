module LandingPagesHelper

  def render_content(landing_page, section_name)
    #raw textilize landing_page.send(section_name.to_sym)
    raw landing_page.send(section_name.to_sym)
  end

end
