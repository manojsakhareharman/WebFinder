class ResourcesController < ApplicationController

  def show
    @resource = Resource.find params[:id]
    redirect_to @resource.attachment.url, status: 301 and return false
  end

end
