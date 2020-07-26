class PhotosController < ApplicationController

    def index
        @photos = Photo.all 
    end
    
    def new
        @photo = @dog.photos.new(photo_params)
        @photo.dog = current_dog
        # or can i do @photo.dog = current_user
        @photo.save
        redirect_to new_dog_photo(@photo)
    end

    def create
        @photo = current_user.photos.build(photo_params) # do I have access to current_user?
        if @photo.save
            redirect_to photos_path(@photo) #photos index page
        else
            render :new
        end
    end 

    def show
        @photo = Photo.find_by_id(params[:id])
        redirect_to dog_photo_path(@photo)
        # page showing the photo newly created
    end

    def edit
        @photo = Photo.find_by_id(params[:id])
        @photo.update 
    end
    
    def update

    end

    def destroy

    end

    private

    def photo_params
        params.require(:photo).require(:caption, :star, :images, :dog_id)
    end
end
