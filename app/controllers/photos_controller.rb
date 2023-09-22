class PhotosController < ApplicationController
  def index
    @photos = Photo.all.order(created_at: :desc)
  end

  def create
    @photo = Photo.new
    @photo.image = params.fetch("input_image")
    @photo.caption = params.fetch("input_caption")
    @photo.owner_id = params.fetch("input_owner_id")

    if @photo.valid?
      @photo.save

      flash[:notice] = "Photo created successfully."

      redirect_to("/photos/#{@photo.id}")
      
    else 
      flash[:notice] = "Photo failed to crate successfully."
      redirect_to photos_path
    end
  end

  def show
    id = params.fetch("id")
    @photo = Photo.find_by(id: id)
    @comments = Comment.where(photo_id: id).order(created_at: :desc)
  end

  def update
    id = params.fetch("id")
    @photo = Photo.find_by(id: id)

    @photo.image = params.fetch("input_image")
    @photo.caption = params.fetch("input_caption")

    if @photo.valid?
      @photo.save

      flash[:notice] = "Photo updated successfuly."

      redirect_to("/photos/#{@photo.id}")
    else 
      flash[:notice] = "Unable to update photo, please try again."
      redirect_to("/photo/#{@photo.id}")
    end
  end

  def destroy
    id = params.fetch("id")
    @photo = Photo.find_by(id: id)
    @photo.destroy

    flash[:notice] = "Photo successfully deleted."
    
    redirect_to photos_path
  end

  def add_comment
    @comment = Comment.new
    @comment.photo_id = params.fetch("input_photo_id")
    @comment.author_id = params.fetch("input_author_id")
    @comment.body = params.fetch("input_body")

    if @comment.valid?
      @comment.save

      flash[:notice] = "Comment successfully added."
      redirect_to("/photos/#{@comment.photo_id}")

    else
      flash[:notice] = "Unable to add comment."
      redirect_to("/photos/#{params.fetch("input_photo_id")}")
    end
  end

end
