class Music < Application

  def index
    @albums = Album.all
    @artists = Artist.all
    render
  end
  
end
