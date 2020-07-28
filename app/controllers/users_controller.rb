class UsersController < ApplicationController
    
    def new
        @user = User.new
        @dog = Dog.new
    end

    def show
        @user = User.find_by_id(params[:id])
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:msg] = "Logged in successfully"
            redirect_to user_path(@user)
        else
            render :new 
        end
    end
   

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

end
