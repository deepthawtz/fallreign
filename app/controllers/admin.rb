class Admin < Application
  # before :ensure_authenticated

  def index
    @artists = Artist.all
    @albums  = Album.all
    @articles = Article.all
    display @artists
  end  
end
