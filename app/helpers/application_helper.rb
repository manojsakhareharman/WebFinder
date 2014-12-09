module ApplicationHelper

  def top_vertical_market_navigation(options)
    VerticalMarket.parent_verticals.map do |vm|
      menu_link_for(vm, options)
    end.join.html_safe
  end

  def menu_link_for(vm, options)
    tree_links = (options[:dropdowns] == true) ? tree_links_for(vm, options) : ''
    content_tag(:li, class: dropdown_class_for(vm, options)) do
      link_to(vm.name, vm) + tree_links
    end
  end

  def tree_links_for(vm, options)
    if vm.children.length > 0
      c = vm.children.map do |cvm|
        menu_link_for(cvm, options)
      end
      content_tag(:ul, c.join.html_safe, class: "dropdown")
    end
  end

  def dropdown_class_for(vm, options)
    if options[:dropdowns]
      vm.children.length > 0 ? "has-dropdown" : ""
    end
  end

end
