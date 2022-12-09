class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])  # Finds article by ID
    end
    
    def index
        @articles = Article.all  # Finds all articles
    end
    
    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        
        if  @article.save
            flash[:notice] = 'Article was created successfully!'
            
            # redirect_to article_path(@article)  # Original redirect code
            redirect_to @article  # Redirect shortcut
        else
            render 'new'  # Renders new action template
        end
    end
end