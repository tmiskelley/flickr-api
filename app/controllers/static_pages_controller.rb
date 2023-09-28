class StaticPagesController < ApplicationController
  def index
    flickr_service = FlickrService.new
    @user_id = ENV['USER_ID']
    unless @user_id.nil?
      @photos = flickr_service.get_photos(@user_id)
    end
  end
end
