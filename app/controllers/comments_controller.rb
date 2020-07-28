class CommentsController < ApplicationController

    before_action :set_comment
   
    def create
        @comment = @photo.comments.new(comment_params)

    end

    private

    def comment_params
        params.require(:comment).permit(:content, :dog_id, :photo_id, :user_id)
    end

    def set_comment
        @comment = Comment.find(params[:photo_id])
    end
end
