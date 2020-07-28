class CommentsController < ApplicationController

    def index
        # show list of all the comments for a photo
    end
    
    def new
        @comment = Comment.new
    end
    
    def create

    end

    def show
    end
end
