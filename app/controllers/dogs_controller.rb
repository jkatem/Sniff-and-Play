class DogsController < ApplicationController

    before_action :set_user
    before_action :set_dog, only: [:show, :edit, :update, :destroy]

    def new
        @dog = Dog.new
    end

    def show
    end

    def create
        @dog = Dog.new(dog_params)
        @dog.user_id = current_user.id 
        if @dog.save
          redirect_to user_dog_url(@user, @dog)       
        else
          render :new
        end
    end

    def edit
    end

    def update
      if @dog.update(dog_params)
        redirect_to user_dog_url(@user, @dog)     
      else
        render :edit
      end
    end 

    def destroy
        @dog.destroy 
        redirect_to user_url(@user)
    end 

    private

    def dog_params
        params.require(:dog).permit(:name, :age, :breed, :hobbies, :bio, :user_id)
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_dog
      @dog = @user.dogs.find(params[:id])
    end
end
