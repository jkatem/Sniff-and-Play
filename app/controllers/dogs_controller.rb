class DogsController < ApplicationController
    # before_action :set_dog

    def index
        if current_user 
            @dogs = current_user.dogs  
        else 
            @dogs = Dog.all
        end
    end

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
          @post = @user.posts.build
        else
          @post = Post.new
        end
    end

    def show
        @dog = Dog.find(params[:id])
    end

    def create
        @dog = current_user.dogs.build(dog_params)
        # @dog.user = current_user
        @dog.save
           flash[:notice] = "Dog saved"
           redirect_to dogs_path(@dog)
           
        # else
            # render :new
        # end
    end

    def edit
        @dog = Dog.find(params[:id])
    end

    def update
        @dog = Dog.find(params[:id])
        @dog.update(dog_params)
        redirect_to dog_path(@dog)
    end 


    def destroy
        @dog = Dog.find_by(params[:id])
        @dog.destroy 
        redirect_to user_path(current_user)
    end 

    private

    def dog_params
        params.require(:dog).permit(:name, :age, :breed, :hobbies, :bio, :user_id)
    end

    # def set_dog
    #     @dog = Dog.find_by(params[:id])
    # end


end
