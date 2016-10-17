class ArtistsController < ApplicationController
  def index
  end

  def new
    @artist = Artist.new
  end

  def create
  end

  def show
    begin
      @artist = Artist.find(params[:id])
    rescue ActiveRecord::RecordNotFound => err
      render "/errors/not_found", status: :not_found
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def artist_params
  end
end
