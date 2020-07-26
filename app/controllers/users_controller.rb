class UsersController < ApplicationController
    
    def new
        @user = User.new
        # @dogs = Dog.all
    end

    def show
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        # @dog = User.find(@dog.user_id)

        redirect_to '/' if !@user
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
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
