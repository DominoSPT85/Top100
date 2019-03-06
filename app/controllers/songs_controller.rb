class SongsController < ApplicationController
  before_action :set_billboard

  before_action :set_song, only: [:show, :update, :edit, :destroy]

  def index
    @songs = @billboard.songs
  end

  def show

  end

  def new
    @artists = Artist.all - @billboard.artists
    @song = @billboard.songs.new
    render partial: 'songs/form'
  end

  def create 
    @song = @billboard.songs.new(song_params)

    if @song.save
      redirect_to billboard_songs_path(@billboard)
    else
      render :new
    end

  end

  def edit
    render partial: 'songs/form'
  end

  def update
    if @song.update(song_params)
      redirect_to billboard_songs_path(@billboard)
    else
      render :edit
    end

  end

  def destroy
    @song.destroy
    redirect_to billboard_songs_path(@billboard)
  end



  private

    def song_params
      params.require(:song).permit(:song_name, :rank, :billboard_id, :artist_id)
    end


    def set_billboard
      @billboard = Billboard.find(params[:billboard_id])
    end

    def set_song
      @song = Song.find(params[:id])
    end
end
