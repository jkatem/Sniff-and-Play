class CommentsController < ApplicationController

    def create
        @comment.user = current_user
        @comment.save
    end
end
