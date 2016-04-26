module CmsHelper

  def cms_breadcrumbs
    unless current_page?(cms_root_path) || devise_controller?
      content_tag :ul, class: 'breadcrumbs' do
        content_tag(:li, link_to('CMS', cms_root_path)) + current_locale_links
      end
    end
  end

  private

  # Breadcrumb links for translators (if controller assigned a locale)
  def current_locale_links
    if @available_locale
      link = link_to(@available_locale.name, [:cms, @available_locale])
      if current_page?(cms_available_locale_path(@available_locale))
        content_tag(:li, link, class: 'current hide-for-small')
      else
        content_tag(:li, link) + translatable_items_links + other_items_links
      end
    end
  end

  # Collects breadcrumb navigation links for translatable items.
  def translatable_items_links
    AvailableLocale.translatables.map do |t|
      translatable_links(t)
    end.join.html_safe
  end

  # Builds breadcrumb links for an individual translatable type. Tries to do it
  # intelligently based on the global variables assigned up to the point where this
  # is run (usually by the controller).
  def translatable_links(t)
    link = link_to(t.titleize.pluralize, [:cms, @available_locale, t.constantize])

    var_name = t.underscore.parameterize # (ie, "brand" or "product")
    if item = instance_variable_get("@#{var_name.singularize}")
      content_tag(:li, link) + item_link(item)
    elsif instance_variable_get("@#{var_name.pluralize}")
      content_tag(:li, link, class: 'current hide-for-small')
    end
  end

  # Breadcrumb link to a specific brand, product, etc. instance
  def item_link(item)
    if !item.new_record?
      if item.respond_to?(:name)
        content_tag(:li, link_to(item.name, [:cms, @available_locale, item]), class: 'current hide-for-small')
      elsif item.respond_to?(:headline)
        content_tag(:li, link_to(item.headline.truncate(30), [:cms, @available_locale, item]), class: 'current hide-for-small')
      elsif item.respond_to?(:title)
        content_tag(:li, link_to(item.title.truncate(30), [:cms, @available_locale, item]), class: 'current hide-for-small')
      end
    end
  end

  def other_items_links
    ret = ""
    custom_menu_link = cms_available_locale_menu_items_path(@available_locale)
    if current_page?(custom_menu_link)
      ret += link_to("Customize Navigation", custom_menu_link, class: 'current hide-for-small')
    elsif controller.controller_name == "menu_items"
      ret += link_to("Customize Navigation", custom_menu_link)
    end
    ret.html_safe
  end

end
