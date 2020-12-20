class CommentsController < ApplicationController
    def index
        @comments = Comment.where(article_id: params[:id])
    end
end
