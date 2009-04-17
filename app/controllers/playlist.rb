class Playlist < Application
  
  def index
    render
  end
  
  def playlist      
    provides :xspf
    @songs = Song.all
    render :playlist
  end
  
end
