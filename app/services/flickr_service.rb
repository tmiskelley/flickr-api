class FlickrService
  def initialize
    @api_key = ENV['FLICKR_API_KEY']
    @secret = ENV['FLICKR_API_SECRET']
    @flickr = Flickr.new(@api_key, @secret)
  end

  def get_photos(user_id)
    photos = @flickr.photos.search(user_id: user_id)
    photo_urls = []

    photos.each do |photo|
      # Access the URL components and construct the URL
      farm_id = photo['farm']
      server_id = photo['server']
      photo_id = photo['id']
      secret = photo['secret']
      photo_url = "https://farm#{farm_id}.staticflickr.com/#{server_id}/#{photo_id}_#{secret}.jpg"
      photo_urls << photo_url
    end

    photo_urls
  end
end
