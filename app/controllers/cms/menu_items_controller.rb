class Cms::MenuItemsController < CmsController
  before_action :set_locale_for_translator

  def index
    if @available_locale
      render template: 'cms/available_locales/menu_items/index' and return false
    end
  end

  def new
    @menu_item = MenuItem.new
    if @available_locale
      render template: 'cms/available_locales/menu_items/new' and return false
    end
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)
    if @available_locale
      @menu_item.locale = @available_locale
      if @menu_item.save
        redirect_to cms_available_locale_menu_items_path(@available_locale), notice: "Success!"
      else
        render template: 'cms/available_locales/menu_items/new' and return false
      end
    end
  end

  private

  def menu_item_params
    params.require(:menu_item).permit(:title, :link)
  end
end
