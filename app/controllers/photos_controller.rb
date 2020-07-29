class PhotosController < ApplicationController

    before_action :current_user
    
    def index
        # byebug
     
      @dog = Dog.find_by_id params[:dog_id]
      @photo = 
      @comment = 
      if @dog 
        @photos = @dog.photos  
      end
    end
    
    def new
        @photo = Photo.new
    end

    def create
        @photo = Photo.new(photo_params)
        @photo.dog_id = params[:dog_id]
        if @photo.save!
            redirect_to dog_photos_path(current_dog)
        else
            render :new
        end
    end 

    def show
        @photo = current_dog.photos.find_by_id(params[:id])
    end

    def destroy
        @dog = Dog.find_by(params[:dog_id])
        @dog.destroy
        redirect_to dog_photos_path(@dog) 
        # byebug    
    end

    private

    def photo_params
        params.require(:photo).permit(:caption, :star, :dog_id, :image_file) 
    end

    def current_dog
        current_dog = current_user.dogs.find_by_id params[:dog_id]
        
    end

    # def set_photo
    #     @photo = 
    # end
end
