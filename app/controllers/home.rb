class Home < Application
  #before :ensure_authenticated

  def index
    # @articles = Article.all(:order => [:created_at.desc])
    @articles = Article.paginate :page => params[:page], :per_page => 5
    # render
    display @articles
  end
  
end
