class ArtistsController < ApplicationController

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artist_path(@artist)
    else
      flash.now[:error] = "Could not save artist"
      render action: "new"
    end 
  end

  def show
    @artist = Artist.find(params[:id])
    session[:secret] = "This time for real, though"
    @songs = @artist.songs
  end

private
  def artist_params
    params.require(:artist).permit(:name)
  end

end
