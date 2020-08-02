class UsersController < ApplicationController
    
    def new
        @user = User.new
    end

    def show
        @photos = current_user.photos
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:msg] = "Logged in successfully"
            redirect_to user_url(@user)
        else
            render :new 
        end
    end
   
    def photos
        @photos_with_comment = current_user.photos
        user = User.find(params[:user_id])
        dog_ids = User.find(user.id).dog_ids
        all_photos = Photo.where("dog_id": dog_ids)
        @photos_without_comment = all_photos - @photos_with_comment
      end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

end
