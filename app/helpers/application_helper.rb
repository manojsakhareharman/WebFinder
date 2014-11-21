module ApplicationHelper

  def top_vertical_market_navigation
    VerticalMarket.parent_verticals.map do |vm|
      content_tag(:li) do
        link_to(vm.name, vm)
      end
    end.join.html_safe
  end

end
