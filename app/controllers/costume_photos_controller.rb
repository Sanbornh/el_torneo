class CostumePhotosController < ApplicationController

before_action :find_photo, only: [:show, :edit, :update, :destroy, :upvote]
  
  def index
    @photos = CostumePhoto.all
  end

  def show
  end

  def new
    @photos = CostumePhoto.new
  end

  def create
    @photo = CostumePhoto.new(photo_params)

    if @photo.save
      redirect_to photos_url, notice: "Your photo was successfully uploaded"
    else
      render :new
    end
  end

  def upvote
    @vote = @photo.votes.build

    if @vote.save
      redirect_to photos_path
    end
  end

  private

  def find_picture
    @photo = CostumePhoto.find(params[:id].to_i)
  end

  def photo_params
    params.require(:photo).permit(:title, :photo)
  end

end
