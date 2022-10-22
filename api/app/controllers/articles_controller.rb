class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  # GET /articles
  def index
    @articles = Article.all

    # render json: {status: 'Success', code: 404, data:@articles}
    options={}
    options[:meta] = {total: Article.count}
    render json: ArticleSerializer.new(@articles,options), status: 404
  end

  # GET /articles/1
  def show
    # render json: @article
    render json: ArticleSerializer.new(@article)
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article, status: :created, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content)
    end
end
