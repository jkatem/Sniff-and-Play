class PhotosController < ApplicationController

    before_action :set_user
    before_action :set_dog

    def index     
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
            redirect_to user_dog_photos_url(@user, @dog)
        else
            render :new
        end
    end 

    def show
        @photo = @dog.photos.find(params[:id])
    end

    private

    def photo_params
        params.require(:photo).permit(:caption, :star, :dog_id, :image_file) 
    end

    def set_dog
        @dog = @user.dogs.find params[:dog_id]
    end

    def set_user
      @user = User.find(params[:user_id])
    end

end
