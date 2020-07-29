class DogsController < ApplicationController
    # before_action :set_dog

    # def index
      
    #   if current_user 
    #       @dogs = current_user.dogs  
    #   else 
    #       @dogs = Dog.all
    #   end
    # end

    def new
        @dog = Dog.new
    end

    def show
        @dog = current_user.dogs.find_by_id(params[:id])

    end

    def create
        @dog = Dog.new(dog_params)
        @dog.user_id = current_user.id 
        # @dog = current_user.dogs.build(dog_params)
        if @dog.save
           flash[:notice] = "Dog saved"
           redirect_to dog_path(@dog)          
        else
            # @dog.build_user unless @dog.user
            render :new
        end
    end

    def edit
        @dog = current_user.dogs.find_by(params[:id])
    end

    def update
        @dog = current_user.dogs.find_by(params[:id])
        @dog.update(dog_params)
        redirect_to dog_path(@dog)
    end 


    def destroy
        @dog = current_user.dogs.find_by(params[:id])
        @dog.destroy 
        redirect_to user_path(current_user)
        
    end 

    private

    def dog_params
        params.require(:dog).permit(:name, :age, :breed, :hobbies, :bio, :dog_avatar, :user_id)
    end

    # def set_dog
    #     @dog = Dog.find_by(params[:id])
    # end


end
