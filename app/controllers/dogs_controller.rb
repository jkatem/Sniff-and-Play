class DogsController < ApplicationController

    # before_action :delete_photo, only: [:destroy]
    before_action :set_user
    before_action :set_dog, only: [:show, :edit, :update, :destroy]

    def index
      if @user 
          @dogs = @user.dogs.sort_name
      else 
          @dogs = Dog.all
      end
    end

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
        @dog.update(dog_params)
        redirect_to user_dog_url(@user, @dog)
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
      @user = current_user
    end

    def set_dog
      @dog = @user.dogs.find(params[:id])
    end
end
