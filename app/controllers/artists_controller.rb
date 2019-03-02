class ArtistsController < ApplicationController
  before_action :find_artist, only: [:show, :update, :edit, :destroy]

  def index
    @artists = Artist.all
  end

  def show
  end

  def new
    @artist = Artist.new

    render partial: 'artists/form'
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to artists_path
    else
      render :new
    end
  end

  def edit
    render partial: 'artists/form'
  end

  def update
    if @artist.update(artist_params)
      redirect_to artists_path
    else
      render :edit
    end
  end

  def destroy
    @artist.destroy
    redirect_to artist_path

  end



  private

      def artist_params
        params.require(:artist).permit(:name)
      end

      def find_artist
        @artist = Artist.find(params[:id])
      end

end

