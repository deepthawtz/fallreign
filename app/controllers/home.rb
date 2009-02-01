class Home < Application
  #before :ensure_authenticated

  def index
    @articles = Article.all(:order => [:created_at.desc])
    # render
    display @articles
  end
  
end
