class Articles < Application
  # provides :xml, :yaml, :js
  before :ensure_authenticated, :exclude => [:show, :index]

#http://fallreign.com

  def index
    @articles = Article.all
    display @articles
  end

  def show(id)
    @article = Article.get(id)
    raise NotFound unless @article
    display @article
  end

  def new
    only_provides :html
    @article = Article.new
    display @article
  end

  def edit(id)
    only_provides :html
    @article = Article.get(id)
    raise NotFound unless @article
    display @article
  end

  def create(article)
    @article = Article.new(article)
    if @article.save
      redirect '/admin#ui-tabs-13'
    else
      message[:error] = "Article failed to be created"
      render :new
    end
  end

  def update(id, article)
    @article = Article.get(id)
    raise NotFound unless @article
    if @article.update_attributes(article)
      redirect '/admin#ui-tabs-13'
    else
      display @article, :edit
    end
  end

  def destroy(id)
    @article = Article.get(id)
    raise NotFound unless @article
    if @article.destroy
      redirect '/admin#ui-tabs-13'
    else
      raise InternalServerError
    end
  end

end # Articles
