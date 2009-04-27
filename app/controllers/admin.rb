class Admin < Application
  before :ensure_authenticated
  def index              
    @article = Article.all   
    display @article, :layout => "admin"
  end  
  def artists          
    @artist = Artist.new
    @artists = Artist.all
    display @artist          
  end                    
  def albums
    @album = Album.new
    @albums = Album.all  
    display @album
  end                    
  def articles    
    @article = Article.new
    @articles = Article.all  
    display @article
  end                    
  def links         
    @link = Link.new
    @links = Link.all  
    display @link
  end                    
  def gallery    
    @art = Art.new
    @arts = Art.all
    display @art
  end
  def audio_files
    @audio_file = AudioFile.new
    @audio_files = AudioFile.all
    render :audio_files
  end
  def settings
    @settings = Settings.all
    render
  end        
end
