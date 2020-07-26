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
        @dog = Dog.new            
    end

    def show   
        @dog = Dog.find(params[:id])              
    end

    def create
        @dog = Dog.new(dog_params)
        @dog.user = current_user
        if @dog.save
            redirect_to user_path(@dog) # = redirects to dogs index
        else 
            render 'new'
        end
        
    end

    def edit

    end

    def delete

    end 

    private

    def dog_params
        params.require(:dog).permit(:name, :age, :breed, :hobbies, :bio, :user_id)
    end

    # def set_dog
    #     @dog = Dog.find_by(params[:id])
    # end


end
