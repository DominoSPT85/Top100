class BillboardsController < ApplicationController
  before_action :find_billboard, only: [:show, :update, :edit, :destroy]

  def index
    @billboards = Billboard.all
  end

  def show
    @results = Song.joins(:artist).select('songs.rank, songs.song_name, artists.name').where(:billboard_id => @billboard)

  end

  def new
    @billboard = Billboard.new

    render partial: 'billboards/form'
  end

  def create
    @billboard = Billboard.new(billboard_params)

    if @billboard.save(billboard_params)
      redirect_to billboards_path
    else
      render :edit
    end

  end

  def edit
    render partial: 'subs/form'

  end

  def update

    if @billboard.update(billboard_params)
      redirect_to billboards_path
    else
      render :edit
    end

  end

  def destroy
    @billboard.destroy
    redirect_to billboards_path

  end


  private

    def billboard_params
      params.require(:billboard).permit(:title)
    end


    def find_billboard
      @billboard = Billboard.find(params[:id])
    end


end
