class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :delete, :show]
    before_action :authorize_user, only: [:new, :create, :edit, :update, :delete]
    before_action :redirect_user_if_no_article, only: [:edit, :update, :delete, :show]

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def show
    end
    
    def create
        @article = Article.new(article_params)
        @article.user = @current_user
        if @article.save
            redirect_to articles_path
        else
            redirect_to new_article_path, notice: 'Wrong'
        end
        @revision = Revision.new(article_params)
        @revision.user_id = @current_user.id
        @revision.article_id = @article.id
        @revision.save
    end

    def edit
    end

    def update
        if @article.update(article_params)
            @article.update(edited_article: true)
            @revision = Revision.new(article_params)
            @revision.user_id = @current_user.id
            @revision.article_id = @article.id
            @revision.save
            redirect_to articles_path
        else
            redirect_to edit_article_path(@article), notice: 'Wrong'
        end
    end
    
    def delete
        @revision = Revision.where(article_id: @article.id)
        @revision.destroy_all
        @article.destroy
        redirect_to articles_path
    end

    private

    def set_article
        @article = Article.find_by(id: params[:id])
    end

    def authorize_user
        if @current_user.nil?
            redirect_to sign_in_path
        end
    end

    def redirect_user_if_no_article
        if @article.nil? 
            redirect_to articles_path
        end
    end

    def article_params
        params.require(:article).permit(:content, :title)
    end
end
