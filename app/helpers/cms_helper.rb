module CmsHelper

  def cms_breadcrumbs
    unless current_page?(cms_root_path) || devise_controller?
      content_tag :ul, class: 'breadcrumbs' do
        content_tag(:li, link_to('CMS', cms_root_path)) +
          current_locale_links
      end
    end
  end

  private

  def current_locale_links
    if @available_locale
      content_tag(:li, link_to(@available_locale.name, [:cms, @available_locale]),
                  class: current_page?(cms_available_locale_path(@available_locale)) ? 'current hide-for-small' : '') +
        translatable_items_links
    end
  end

  def translatable_items_links
    links = ''
    AvailableLocale.translatables.each do |t|
      if eval("@#{t.underscore.parameterize.singularize}")
        links += content_tag(:li, link_to(t, [:cms, @available_locale, t.constantize]))
      elsif eval("@#{t.underscore.parameterize.pluralize}")
        links += content_tag(:li, link_to(t.titleize.pluralize, [:cms, @available_locale, t.constantize]),
                             class: 'current hide-for-small')
      end
    end
    links.html_safe
  end

end
