class Music < Application

  def index
    @albums = Album.all
    render
  end
  
end
