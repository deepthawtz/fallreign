class Catalog < Application

  def index
    @albums = Album.all
    render
  end
  
end
