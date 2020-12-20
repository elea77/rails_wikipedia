class CommentsController < ApplicationController
    before_action :set_article, only: [:delete]

    def index
        @comments = Comment.where(article_id: params[:id])
    end

    def delete
        @comment = Comment.find_by_id(params[:idComment])
        @comment.destroy
        redirect_to article_url(:id => @article.id)
    end

    def set_article
        @article = Article.find_by(id: params[:idArticle])
    end
end
