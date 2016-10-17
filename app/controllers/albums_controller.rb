class AlbumsController < ApplicationController
  def index
    artist_id = params[:artist_id]
    if artist_id.nil?
      @albums = Album.all
    else
      artist = Artist.find(artist_id)
      @albums = artist.albums
    end
  end
end
