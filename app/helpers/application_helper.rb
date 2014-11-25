module ApplicationHelper

  def top_vertical_market_navigation
    VerticalMarket.parent_verticals.map do |vm|
      menu_link_for(vm)
    end.join.html_safe
  end

  def menu_link_for(vm)
    content_tag(:li, class: dropdown_class_for(vm)) do
      link_to(vm.name, vm) + tree_links_for(vm)
    end
  end

  def tree_links_for(vm)
    if vm.children.length > 0
      c = vm.children.map do |cvm|
        menu_link_for(cvm)
      end
      content_tag(:ul, c.join.html_safe, class: "dropdown")
    end
  end

  def dropdown_class_for(vm)
    vm.children.length > 0 ? "has-dropdown" : ""
  end

end
