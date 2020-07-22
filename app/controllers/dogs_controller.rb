class DogsController < ApplicationController
    
    def index
        @dogs = current_user.dogs
    end

    def new
        @dog = Dog.new
    end

    def create
    end

    def show
    end

    def edit
    end

    def delete
    end 

    private

    def dog_params
        params.require(:dog).permit(:name, :age, :breed, :hobbies, :bio)
    end
end
