class Music < Application
  
  def popout_player
    render "Fall Reign Player"
  end

  def playlist
    only_provides :xspf
    @songs = Song.all
    render :playlist
  end
  
end
