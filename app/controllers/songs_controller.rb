class SongsController < ApplicationController
  before_action :set_song, only: [:show, :update, :edit]
  
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params(:name, :bio, :genre_id, :artist_id))
		@song.save
		redirect_to song_path(@song)
  end

  def update
		@song.update(song_params(:name, :bio, :genre_id, :artist_id))
		redirect_to song_path(@song)
  end

	private
  
  def set_song
    @song = Song.find(params[:id])
  end

	def song_params(*args)
		params.require(:song).permit(*args)
  end

end
