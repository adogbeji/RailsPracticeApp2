class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])  # Finds article by ID
    end
    
    def index
        @articles = Article.all  # Finds all articles
    end
    
    def new
    end
    
    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        @article.save
        redirect_to article_path(@article)  # Original Redirect code
    end
end