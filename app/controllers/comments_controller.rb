class CommentsController < ApplicationController

    before_action :set_comment, only: [:edit, :destroy, :update, :show]
   
    def create
        
        @photo = Photo.find(params[:photo_id])
        comment = Comment.new(comment_params)
        comment.photo_id = @photo.id 
        comment.dog_id = @photo.dog_id
        comment.user_id = Dog.find(@photo.dog_id).user_id
        comment.save
        redirect_back(fallback_location: root_path)
    end

    def user_create
      comment = Comment.new(comment_params)
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :dog_id)
    end

    def set_comment
        @comment = Comment.find(params[:photo_id])
    end
end
