class Admin < Application
  before :ensure_authenticated

  def index              
    render
  end
  
  def artists
    @artists = Artist.all  
    render 
  end                    
      
end
