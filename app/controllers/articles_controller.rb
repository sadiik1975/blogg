class ArticlesController < ApplicationController

def index
  @articles = Article.all
end


def new


 
  @article = Article.new


end

def edit
  @article = Article.find(params[:id])
  
end

def create
   @article = Article.new(article_params)
   @article.user = User.first
if @article.save
  flash[:success] = "Article was sucessfully created"
  redirect_to article_path(@article)
else
  render "new"
end
 
end

def update
  @article = Article.find(params[:id])
if @article.update(article_params)
  flash[:success] = "Article was successfully updated"
  redirect_to article_path(@article)
else
   render 'edit'
end
end

def show
  @article = Article.find(params[:id])
  
end

def destroy
  @article = Article.find(params[:id])
  @article.destroy
  flash[:danger]= "Article was successfully deleted"
  redirect_to articles_path
end

private
def set_article
  @article = Article.find(params[:id])

end
def article_params
  params.require(:article).permit(:title, :description)
end


    
end 