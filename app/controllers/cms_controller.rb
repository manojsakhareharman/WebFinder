class CmsController < ApplicationController
  before_filter :authenticate_admin_user!
  layout 'cms'

  def index
  end
end
