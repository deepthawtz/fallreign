class Music < Application
  
  def popout_player
    render :layout => nil
  end

  def playlist
    only_provides :xspf
    @audio_tracks = AudioFile.all
    render :playlist
  end
  
end
