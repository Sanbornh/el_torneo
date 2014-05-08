class CostumePhotosController < ApplicationController

before_action :find_photo, only: [:show, :upvote]
  
  def index
    @costume_photos = CostumePhoto.all
  end

  def show
  end

  def new
    @costume_photo = CostumePhoto.new
  end

  def create
    @costume_photo = CostumePhoto.new(photo_params)

    if @costume_photo.save
      redirect_to costume_photos_path, notice: "Your photo was successfully uploaded"
    else
      render :new
    end
  end

  def upvote
    @vote = @costume_photo.votes.build

    if @vote.save
      redirect_to costume_photos_path
    end
  end

  private

  def find_photo
    @costume_photo = CostumePhoto.find(params[:id].to_i)
  end

  def photo_params
    params.require(:costume_photo).permit(:title, :photo)
  end

end
