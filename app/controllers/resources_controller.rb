class ResourcesController < ApplicationController

  def show
    @resource = Resource.find params[:id]
    redirect_to @resource.attachment.url and return false
  end

end
