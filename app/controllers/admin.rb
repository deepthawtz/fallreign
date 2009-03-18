class Admin < Application
  before :ensure_authenticated

  def index              
    @articles = Article.all
    @artists = Artist.all
    @albums = Album.all
    @links = Link.all
    @arts = Art.all    
    display @artists
  end
  
  def artists
    @artists = Artist.all  
    render 
  end                    
      
end
