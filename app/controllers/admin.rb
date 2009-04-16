class Admin < Application
  before :ensure_authenticated

  def index              
    @article = Article.all   
    display @article, :layout => "admin"
  end
  
  def artists
    @artists = Artist.all  
    render 
  end                    
  def albums
    @albums = Album.all  
    render 
  end                    
  def articles
    @articles = Article.all  
    render 
  end                    
  def links
    @links = Link.all  
    render 
  end                    
  def gallery
    @arts = Art.all
    render
  end
  def songs
    @songs = Song.all
    render
  end    
end
