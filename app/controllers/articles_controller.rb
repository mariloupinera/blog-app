class ArticlesController < ApplicationController
before_action :set_article, only: [:edit, :update, :show, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first

    if @article.save
      flash[:success] = 'Article was Succesfully Created'
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:success] = 'Article was Succesfully Updated'
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:success] = 'Article was Succesfully Deleted'
    redirect_to articles_path
  end

private

    def article_params
      params.require(:article).permit(:title, :description)
    end

    def set_article
      @article = Article.find(params[:id])
    end
end
