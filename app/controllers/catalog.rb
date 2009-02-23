class Catalog < Application

  def index
    @albums = Album.all
    @artists = Artist.all    
    render
  end
  
end
