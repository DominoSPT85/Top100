class SongsController < ApplicationController
    before_action :set_billboard
    before_action :set_artist

    before_action :set_song, only: [:show, :update, :edit, :destroy]

  def index
    @songs = @billboard.@artist.songs
  end

  def show

  end

  def new
    @song = @billboard.@artist.songs.new
    render partial: 'songs/form'
  end

  def create 
    @song = @billboard.@artist.songs.new(song_params)

    if @song.save
      redirect_to [@billboard, @artist, @song]
    else
      render :new
    end

  end

  def edit
    render partial: 'songs/form'
  end

  def update
    if @song.update(song_params)
      redirect_to [@bilboard, @artist, @song]
    else
      render :edit
    end

  end

  def destroy
    @song.destroy
    redirect_to billboard_artist_songs_path
  end



  private

    def song_params
      params.require(:song).permit(:title, :rank)
    end

    def set_billboard
      @billboard = Billboard.find(params[:billboard_id])
    end

    def set_artist
      @artist = Artist.find(params[:artist_id])
    end

    def set_song
      @song = Song.find(params[:id])
    end
end
