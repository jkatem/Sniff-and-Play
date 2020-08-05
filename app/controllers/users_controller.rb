class UsersController < ApplicationController
    
    def new
        @user = User.new
        @dog = Dog.new
    end

    def show
        @photos = current_user.photos.uniq
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:msg] = "Logged in successfully"
            redirect_to user_url(@user)
        else
            flash[:errors] = @user.errors.full_messages
            render :new 
        end
    end
   

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

end
