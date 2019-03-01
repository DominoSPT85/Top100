class BillboardsController < ApplicationController
  
  def index
    @billboards = Billboard.all
  end

  def show
    @billboard = Billboard.find(params[:id])
  end

  def new
    @billboard = Billboard.new
  end

  def create

  end

  def edit

  end

  def update

  end

  def delete

  end


  private





end
