class MediaLibraryController < ApplicationController
  def index
    render_landing_page('media-library')
  end
end
