class Home < Application
  #before :ensure_authenticated

  def index
    @articles = Article.all(:order => [:created_at.desc]).paginate :page => params[:page], :per_page => 5
    display @articles
  end
  
end
