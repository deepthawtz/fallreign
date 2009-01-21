class Home < Application
  #before :ensure_authenticated

  def index
    @articles = Article.all
    # render
    display @articles
  end
  
end
